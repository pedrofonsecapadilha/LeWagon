def contabilizador(file_name, stop_words_file_name)
  result = {}
  File.open(file_name, "r").each_line do |line|
    line.downcase.gsub(/\W/, " ").split.each do |word|
      if File.read(stop_words_file_name).match?(word)
        "Não faz nada e segue para próxima palavra."
      else
        result.include?(word) ? result[word] << "1" : result[word] = "1"
      end
    end
  end
  result
end

def frequent_words(result, number_of_word)
  result2 = {}
  number_of_word.times do
    result2[result.max_by { |_key, value| value }[0]] = result.max_by { |_key, value| value }[1]
    result[result.max_by { |_key, value| value }[0]] = 0
  end
  result2
end

def most_common_words(file_name, stop_words_file_name, number_of_word)
  result = contabilizador(file_name, stop_words_file_name)
  result.map do |key, value|
    value == "1" ? result[key] = 1 : result[key] = value.chars.length
  end
  frequent_words(result, number_of_word)
end
