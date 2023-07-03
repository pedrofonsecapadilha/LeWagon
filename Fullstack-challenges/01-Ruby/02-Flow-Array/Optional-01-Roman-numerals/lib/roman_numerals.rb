OLD_ROMAN_NUMERAL = [1000, 500, 100, 50, 10, 5, 1]
OLD_ROMAN_LETTER = ["M", "D", "C", "L", "X", "V", "I"]

NEW_ROMAN_NUMERAL = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
NEW_ROMAN_LETTER = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

def old_roman_numeral(an_integer)
  # TODO: translate integer in roman number - old-style way
  answer = ""
  OLD_ROMAN_NUMERAL.each_with_index do |number, index|
    t = an_integer / number
    t.times { answer.insert(-1, OLD_ROMAN_LETTER[index]) }
    an_integer = an_integer % number
  end
  answer
end

def new_roman_numeral(an_integer)
  # TODO: translate integer in roman number - modern-style way
  answer = ""
  NEW_ROMAN_NUMERAL.each_with_index do |number, index|
    t = an_integer / number
    t.times { answer.insert(-1, NEW_ROMAN_LETTER[index]) }
    an_integer = an_integer % number
  end
  answer
end
