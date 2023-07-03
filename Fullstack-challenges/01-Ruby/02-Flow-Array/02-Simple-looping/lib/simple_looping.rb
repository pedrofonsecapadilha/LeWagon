def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  if min > max
    -1
  else
    t = 0
    for i in min..max
      t = t + i
    end
    return t
  end
end

def sum_with_while(min, max)
  # CONSTRAINT: you should use a while..end structure
  if min > max
    -1
  else
    t = 0
    while min <= max
      t = t + min
      min = min + 1
    end
    return t
  end
end
