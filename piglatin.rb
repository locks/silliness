# Module to encode/decode PigLatin
#
# It comes ready for commandline usage.
# usage:
#   ruby piglatin.rb <flag> <sentence>
#   <flag>      encode | decode
#   <sentence>  any number of words

module PigLatin
  
  def self.encode sentence
    cypher(sentence) do |word|
      if (consonant? word[0].chr)
        word = "#{word[1..-1]}-#{word[0].chr}ay"
      else
        word
      end
    end
  end
  
  def self.decode sentence
    pattern = /-(\w)ay/
    
    cypher(sentence) do |word|
      if word.match(pattern).to_a.empty?
        word
      else
        word = word[-3].chr + word.gsub(pattern,"")
      end
    end
  end
  
  def self.cypher sentence , &blk
    words = sentence.split(" ")
    
    words = words.map do |word|
      yield(word)
    end
    
    words.join(" ")
  end
  
  def self.consonant? letter
    !vowel? letter
  end
  
  def self.vowel? letter
    "aeiou".include? letter
  end
  
  private
  
end

puts PigLatin.send(ARGV[0].to_sym , ARGV[1..-1].join(" "))