# LE WAGON ANSWER

def louchebemize_word(word)
  random_suffix = %w[em é ji oc ic uche ès].sample
  return word if word.size == 1 # do not translate one-letter word

  if vowel? word[0]
    # word beginning with vowel
    "l#{word}#{random_suffix}" # word beginning with vowel
  else
    # word beginning with 1 or more consonants
    first_vowel_index = word.chars.index { |letter| vowel? letter }
    beginning = word[0...first_vowel_index]
    ending = word[first_vowel_index...word.size]
    "l#{ending}#{beginning}#{random_suffix}"
  end
end

def vowel?(letter)
  %w[a e i o u].include? letter
  # If you want to make it work with diachritics, you can use:
  # "aeiouyéàèùâêîôûëïü".include? letter.downcase
end

def louchebemize(sentence)
  # read http://rubular.com/ bottom regex quick reference for help on regexes
  result_elements = []
  words = sentence.split(/\b/) # Split sentence into words with "any word boundary"

  words.each do |word|
    if word =~ /\W/ # \W stands for "any non-word character"
      result_elements << word # Keep non-word parts as-is
    else
      result_elements << louchebemize_word(word)
    end
  end

  result_elements.join # Build result sentence by joining tokens with space in-between.
end
