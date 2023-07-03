require 'pry'

MORSE_CODE_SYMBOL = {
  ".-" => "A", "-..." => "B", "-.-." => "C", "-.." => "D", "." => "E", "..-." => "F", "--." => "G", "...." => "H",
  ".." => "I", ".---" => "J", "-.-" => "K", ".-.." => "L", "--" => "M", "-." => "N", "---" => "O", ".--." => "P",
  "--.-" => "Q", ".-." => "R", "..." => "S", "-" => "T", "..-" => "U", "...-" => "V", ".--" => "W", "-..-" => "X",
  "-.--" => "Y", "--.." => "Z", "|" => "|"
}

def decode(morse_text)
  text = []
  code = morse_text.gsub("|", " | ").split
  code.each do |i|
    text << MORSE_CODE_SYMBOL[i]
  end
  text.join.gsub("|", " ")
end
