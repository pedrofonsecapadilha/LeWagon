def sum_recursive(min, max)
  # CONSTRAINT: you should use a recursive algorithm, i.e. the method should call itself

  # SE MIN FOR MAIOR QUE MAX RETORNA -1
  if min > max
    -1
    # SE NÃO, RETORNA A SOMA DOS NÚMEROS ENTRE MIN E MAX
  else
    array = (min.to_i..max.to_i).to_a
    array.sum
  end
end
