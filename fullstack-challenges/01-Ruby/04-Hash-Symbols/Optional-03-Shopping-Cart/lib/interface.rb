require_relative 'store'
require_relative 'cart'

cart = []

puts 'Here are the available products:'
puts store_items_to_s

loop do
  puts 'What do you want to buy?'
  product = gets.chomp.downcase

  break if product == ''

  if product_in_store?(product)
    add_to_cart(cart, product)
  else
    puts "We don't have any #{product} in store, sorry!"
  end
end

puts 'Here is your order:'

puts cart_to_s(cart)

total = cart_total_price(cart, store_items)
puts "Total price: #{total}€"
