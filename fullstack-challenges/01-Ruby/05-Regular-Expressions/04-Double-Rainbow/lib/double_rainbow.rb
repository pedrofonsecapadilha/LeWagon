def word_contains_at_least_two_p(sentence)
  # TODO: return the first word in `sentence` containing two 'p's or more
  regexp = /\S*p\w+p{1}+[a-z]*/
  sentence.match(regexp)[0]
end

def word_before_exclamation_mark(sentence)
  # TODO: return the first word located before an exclamation mark
  # Hint: you may want to use `()` groups!
  regexp = /([a-z]*)!/
  sentence.match(regexp)[1]
end

def four_letter_word(sentence)
  # TODO: return the first four-letter word starting with 'b', followed with a comma `,`
  regexp = /(b+[a-z]+),/
  sentence.match(regexp)[1]
end

def last_five_letters(sentence)
  # TODO: return the last five letters of the sentence
  regexp = /([a-z]{5})\z/
  sentence.match(regexp)[1]
end

def word_contains_ll(sentence)
  # TODO: return the first word containing two consecutive 'l'
  regexp = /[a-z]+l{2}+[a-z]+/
  sentence.match(regexp)[0]
end

def six_letter_word(sentence)
  # TODO: return the first six-letter word, composed of letters from 'a' to 'r'
  regexp = /[a-r]{6}/
  sentence.match(regexp)[0]
end

def all_capital_letters(sentence)
  # TODO: return all the capital letters as a string
  # Hint: use `scan` to get all the occurences then `join` them
  regexp = /([A-Z]+)/
  answer = []
  sentence.scan(regexp) do |letter|
    answer << letter
  end
  answer.join
end
