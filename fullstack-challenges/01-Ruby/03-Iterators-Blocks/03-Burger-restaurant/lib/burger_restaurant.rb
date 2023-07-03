def burger(patty, sauce, topping)
  if block_given?
    ["bread", yield(patty), sauce, topping, "bread"]
  else
    ["bread", patty, sauce, topping, "bread"]
  end
end
