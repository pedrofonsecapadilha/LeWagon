require 'pry'

def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.

  [array.select { |element| element.size == size }.sort, array.reject { |element| element.size == size }.sort]
end

def block_splitter(array)
  # TODO: Return an array of two arrays, the first containing
  #       elements for which the given block yields true,
  #       the second containing all the other elements.
  #       No sort needed this time.

  array1 = array.select { |element| yield(element) }
  array2 = array.reject { |element| yield(element) }
  [array1, array2]
end
