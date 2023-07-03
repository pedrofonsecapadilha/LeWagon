def my_map(array)
  array.map do |i|
    yield(i)
  end
end
