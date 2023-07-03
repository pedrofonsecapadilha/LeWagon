def array_to_hash(array)
  resp = {}
  if block_given?
    array.each_with_index { |element, index| resp[yield(index)] = element }
  else
    array.each_with_index { |element, index| resp[index.to_s] = element }
  end
  resp
end
