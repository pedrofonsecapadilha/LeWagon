def sum_odd_indexed(array)
  array_odd = []
  array.each_with_index do |element, index|
    array_odd.push(element) if index.odd?
  end
  array_odd.sum
end

def even_numbers(array)
  array.select { |element| element.even? }
end

def short_words(array, max_length)
  array.reject { |element| element.length > max_length }
end

def first_under(array, limit)
  array.find { |element| element < limit }
end

def add_bang(array)
  array2 = []
  array.map do |element|
    array2.push("#{element}!")
  end
  array2
end

def concatenate(array)
  array.reduce(:+)
end

def sorted_pairs(array)
  array.each_slice(2).map { |element| element.sort }
end
