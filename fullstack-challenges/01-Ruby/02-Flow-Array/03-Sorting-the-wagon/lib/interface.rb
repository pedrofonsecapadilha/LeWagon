require_relative "wagon_sort"

students = []
message = nil
while message != ""
  print "> "
  message = gets.chomp
  students.push(message)
  puts "Type another student name or press enter to finish:" if message != ""
end

students = students.reject { |c| c.empty? }
puts "\nCongratulations! Your Wagon has #{students.length} students:"

if students.length == 1
  puts wagon_sort(students)
else
  result = wagon_sort(students)
  result1 = result.take(students.length - 1)
  result2 = result[students.length - 1]
  puts "#{result1.join(', ')} and #{result2}"
end
