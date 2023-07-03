# def fizz_buzz(number)
#   # TODO: return an array of integers, 'Fizz', 'Buzz' or 'FizzBuzz'
#   # 1. RECEBE UM NUMERO COMO ARGUMENTO "1"
#   # 2. RETORNA UMA ARRAY DE NUMEROS DE 1 ATÉ O NUMERO RECEBIDO
#   array = (1..number.to_i).to_a
#   if number >= 1
#     # 3. TROCA ALGUNS DOS RESULTADOS DE ACORDO COM AS REGRAS:
#     # A. SE DIVISIVEL POR 3 - TROCA POR 'Fizz'
#     # B. SE DIVISIVEL POR 5 - TROCA POR 'Buzz'
#     # C. SE DIVISIVEL POR 3 E 5 - TROCA POR 'FizzBuzz'
#     array.each_with_index do |n, i|
#       if (n % 3).zero? && (n % 5).zero?
#         array[i] = "FizzBuzz"
#       elsif (n % 3).zero?
#         array[i] = "Fizz"
#       elsif (n % 5).zero?
#         array[i] = "Buzz"
#       end
#     end
#   else
#     fail ArgumentError, "#{number} should be greater than 1"
#   end
# end

def test(array)
  array.each_with_index do |n, i|
    if (n % 3).zero? && (n % 5).zero?
      array[i] = "FizzBuzz"
    elsif (n % 3).zero?
      array[i] = "Fizz"
    elsif (n % 5).zero?
      array[i] = "Buzz"
    end
  end
end

def fizz_buzz(number)
  array = (1..number.to_i).to_a
  if number >= 1
    test(array)
  else
    fail ArgumentError, "#{number} should be greater than 1"
  end
end
