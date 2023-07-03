def calculator(number_one, number_two, operator)
  case operator
  when "+" then total = number_one + number_two
  when "-" then total = number_one - number_two
  when "*" then total = number_one * number_two
  when "/" then total = number_one.to_f / number_two
  end
  puts "Answer: #{total}
  "
end
