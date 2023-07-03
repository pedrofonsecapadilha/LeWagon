MORSE_CODE = {
  "a" => ".-", "b" => "-...", "c" => "-.-.", "d" => "-..",
  "e" => ".", "f" => "..-.", "g" => "--.", "h" => "....",
  "i" => "..", "j" => ".---", "k" => "-.-", "l" => ".-..",
  "m" => "--", "n" => "-.", "o" => "---", "p" => ".--.",
  "q" => "--.-", "r" => ".-.", "s" => "...", "t" => "-",
  "u" => "..-", "v" => "...-", "w" => ".--", "x" => "-..-",
  "y" => "-.--", "z" => "--..", "" => " "
}

def encode(text)
  code = []
  if text.gsub(/[,']/, "").downcase.split.length > 1
    text.gsub(/[,']/, "").downcase.split.each_with_index do |word, index|
      word.split(/()/).each { |letter| code << (MORSE_CODE[letter]) }
      code << ("|") if index != text.gsub(/[,']/, "").downcase.split.length - 1
    end
  else
    text.gsub(/[,']/, "").downcase.split.each { |word| word.split(/()/).each { |letter| code << (MORSE_CODE[letter]) } }
  end
  code.join
end
