def shuffle(array)
  # TODO: shuffle the array manually
  old = array.dup # NÃO ENTENDI O PORQUE DO .dup
  randomized = []

  until old.empty?
    n = rand(old.length)
    randomized << old[n]
    old.slice!(n)
  end
  randomized
end
