class Knights
  attr_accessor :words, :sentence

  @@sentence = lambda {|ni| puts "We are the Knights Who Say #{ni}." }

  def initialize(words="ni")
    @words = words
  end

  def say(words="ni")
    words.strip.empty? ? @@sentence.call(capitalize_words(@words)) : @@sentence.call(capitalize_words(words))
  end

  def capitalize_words(string)
    string.split(" ").each {|word| word.capitalize! }.join(" ")
  end
end

Knights.new.say(ARGV.join(" "))
