ROMAN = { "I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000 }

def roman_to_integer(roman_string)
  separate = roman_string.chars
  answer = 0
  separate.each_with_index do |letter, i|
    if ROMAN[separate[i + 1]].nil?
      answer += ROMAN[letter]
    elsif ROMAN[letter] < ROMAN[separate[i + 1]]
      answer += ROMAN[separate[i + 1]] - ROMAN[letter] - ROMAN[separate[i + 1]]
    else
      answer += ROMAN[letter]
    end
  end
  answer
end
