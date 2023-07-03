def group_anagrams(words)
  if words.empty?
    []
  else
    order = Hash.new([])
    words.each.with_index do |element, index|
      order[element.downcase.chars.sort.join] += [index]
    end
    order.map do |_key, value|
      value.map do |i|
        words[i]
      end
    end
  end
end
