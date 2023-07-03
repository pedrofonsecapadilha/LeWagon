require_relative "compute_name"

# TODO: ask for the first name
puts "What's your first name?"
first_name = gets.chomp.to_s

# TODO: ask for the middle name
puts "What's your middle name?"
middle_name = gets.chomp.to_s

# TODO: ask for the last name
puts "What's your last name?"
last_name = gets.chomp.to_s

# TODO: Print a greeting to the user with the full name concatenated,
#       something like "Hello, Boris Paillard"

# puts "Hello, " + first_name + " " + middle_name + " " + last_name
puts "Hello, #{first_name} #{middle_name} #{last_name}"
