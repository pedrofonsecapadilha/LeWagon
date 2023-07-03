require_relative "calculator"

# TODO: you can build your calculator program here!

# 4 tipos básicos de operação +, -, *, /
# => "Enter your first number:"
# Pegar o primeiro número do usuário
# => "Enter your second number:"
# Pegar o segundo número do usuário
# => "Wich oparation you want to do [+] [-] [*] [/]?:"
# Pegar o operador do usuário
# Retornar o resultado final
puts "Enter your first number:"
print "> "
number_one = gets.chomp.to_i

puts "Enter your second number:"
print "> "
number_two = gets.chomp.to_i

puts "Wich oparation you want to do [+] [-] [*] [/]?:"
print "> "
operator = gets.chomp

calculator(number_one, number_two, operator)

# Pergunta ao usuário se ele quer calcular novamente
# Se sim, o programa irá fazer um loop (voltar ao início)
# Se não, encerra o programa

print "You want to use calculator?
=> [y] for yes or [n] for no
"
print "> "
decision = gets.chomp

until decision == "n"
  puts "\n Enter your first number:"
  print "> "
  number_one = gets.chomp.to_i

  puts "Enter your second number:"
  print "> "
  number_two = gets.chomp.to_i

  puts "Wich oparation you want to do [+] [-] [*] [/]?:"
  print "> "
  operator = gets.chomp

  calculator(number_one, number_two, operator)

  print "You want to use calculator?
[y] for yes or [n] for no
"
  print "> "
  decision = gets.chomp
end
