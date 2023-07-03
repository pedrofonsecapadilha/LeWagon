def horse_racing_format!(race_array)
  # TODO: modify the given array so that it is horse racing consistent. This method should return nil.
  race_array.each_with_index { |v, i| race_array[i] = "#{i + 1}-#{v}!" }
  race_array.reverse!
end
