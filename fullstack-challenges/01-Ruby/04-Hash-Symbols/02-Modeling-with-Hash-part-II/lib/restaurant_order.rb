DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Veggie Burger" => 540,
  "Vegan Burger" => 350,
  "Sweet Potatoes" => 230,
  "Salad" => 15,
  "Iced Tea" => 70,
  "Lemonade" => 90
}

MEALS = {
  "Cheesy Combo" =>	DISHES_CALORIES["Cheese Burger"] + DISHES_CALORIES["Sweet Potatoes"] + DISHES_CALORIES["Lemonade"],
  "Veggie Combo"	=> DISHES_CALORIES["Veggie Burger"] + DISHES_CALORIES["Sweet Potatoes"] + DISHES_CALORIES["Iced Tea"],
  "Vegan Combo"	=> DISHES_CALORIES["Vegan Burger"] + DISHES_CALORIES["Salad"] + DISHES_CALORIES["Lemonade"]
}

def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
end

def calories_counter(orders)
  # TODO: return number of calories for a less constrained order
  total_calories = 0
  orders.each do |order|
    if DISHES_CALORIES.key?(order)
      total_calories = total_calories + DISHES_CALORIES[order]
    else
      total_calories = total_calories + MEALS[order]
    end
  end
  total_calories
end
