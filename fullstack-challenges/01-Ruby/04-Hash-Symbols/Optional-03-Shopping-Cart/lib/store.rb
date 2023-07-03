def store_items
  store = { yogurts: 2, meat: 7, vegetables: 5, potatoes: 2, rice: 1 }
  return store
end

def product_in_store?(product)
  store_items.include?(product.to_sym)
end

def price_of_product(product)
  store_items[product.to_sym]
end

def store_items_to_s
  list = []
  store_items.each do |key, value|
    list.push("- #{key}: #{value}€")
  end
  list.join("\n")
end
