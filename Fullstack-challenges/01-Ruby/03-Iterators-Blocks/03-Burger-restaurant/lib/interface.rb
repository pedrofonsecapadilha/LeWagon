require_relative "burger_restaurant"

puts "💬 I'd like a burger with a bigger portion of fish, plus mayo and salad please."
bigger_burger = burger("fish", "mayo", "salad") do |patty|
  patty.upcase
end

puts "💬 I'd like a juicy steak with barbecue sauce and cheddar please."
juicy_burger = burger("steak", "barbecue", "cheddar") do |patty|
  patty.tr("aeiou", "~")
end

puts "💬 I'd like a spicy chicken with ketchup and cheddar please."
spicy_burger = burger("chicken", "ketchup", "cheddar") do |patty|
  "*#{patty}*"
end

# DO NOT remove this line, written for testing purpose
@variables = (local_variables.collect { |v| [v, binding.local_variable_get(v)] }).to_h
