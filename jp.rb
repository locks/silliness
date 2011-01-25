# -*- encoding: utf-8 -*-

ROMAJI = %w(
a i u e o
ka ki ku ke ko
sa shi su se so
ta chi tsu te to
na ni nu ne no
ha hi hu he ho
ma mi mu me mo
ya yu yo
ra ri ru re ro
wa wo
n).join(" ").split(" ")

puts ROMAJI.inspect

HIRAGANA = %w(
あいうえお
かきくけこ
さしすせそ
たちつてと
なにぬねの
はひふへほ
まみむめも
やゆよ
らりるれろ
わを
ん).join("").split("")

KATAKANA = %w(
アイウエオ
カキクケコ
サシスセソ
タチツテト
ナニヌネノ
ハヒフヘホ
マミムメモ
ヤユヨ
ラリルレロ
ワヲ
ン).join("").split("")

playing = true
@kata = @hira = true
@score = 0
@count = 0

puts "Welcome to the Kana Kuiz (I'm so clever).",""
puts "Usage:"
puts "  kata\t\tonly shows katakana",
     "  hira\t\tonly shows hiragana",
     "  kana\t\tshows both",""
puts "  exit\t\texits game (default)",""
puts "That is all, good luck. Oh, and try to get the kanas right.",""

def check_answer(input)
  letters = []
  letters += HIRAGANA if (@hira)
  letters += KATAKANA if (@kata)

  posich = rand(letters.size-1)

  roma = (letters.size > 46) ? posich - 46 : posich 

  print "#{letters[posich]} "
  input = gets.chomp

  @count += 1

  if (input == ROMAJI[roma])
    @score += 1
    puts "Yay! #{@score}/#{@count} right so far"
  else
    puts "Oh no, you missed it. It was #{ROMAJI[roma]}"
  end
end

while (playing) do
  case (input = gets.chomp)
  when "exit"
    playing = false
  when "kata"
    @kata = true
    @hira = false
    puts "Katana only"
  when "hira"
    @kata = false
    @hira = true
    puts "Hiragana only"
  when "kana"
    @kata = @hira = true
    puts "Both on"
  when "score"
    puts "You currently have: #{@score} points"
  else
    check_answer(input)
  end
end
