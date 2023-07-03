def add_to_cart(cart, product)
  cart.push(product)
end

def cart_to_s(cart)
  cart.join(", ")
end

def cart_total_price(cart, store_items)
  sum = 0
  cart.each do |i|
    sum += store_items[i.to_sym] if store_items.include?(i.to_sym)
  end
  sum
end
