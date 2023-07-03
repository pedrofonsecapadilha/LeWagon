def louchebemize(sentence)
  vogals = ["a", "e", "i", "o", "u"]
  special = [", ", "!!", " "]
  sufix = ["em", "é", "ji", "oc", "ic", "uche", "ès"]
  result = []

  if sentence.size == 1
    sentence
  else
    sentence.split(/\b/).each do |word|
      if special.include?(word)
        result.push(word)
      elsif vogals.include?(word[0])
        vogal_word = ["l"]
        vogal_word.push(word)
        vogal_word.push(sufix.sample)
        result.push(vogal_word.join)
      else
        consonant_start = ["l"]
        consonant_end = []
        consonant_middle = word.chars
        word.chars.each do |letter|
          if vogals.include?(letter)
            break
          else
            consonant_end.push(letter)
            consonant_middle.shift
          end
        end
        consonant_start.push(consonant_middle.join)
        consonant_start.push(consonant_end)
        consonant_start.push(sufix.sample)
        result.push(consonant_start.join)
      end
    end
    result.join
  end
end
