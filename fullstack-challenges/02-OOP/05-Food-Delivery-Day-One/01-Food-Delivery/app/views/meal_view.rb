class MealView
  def new_meal_name
    puts "What is the new meal name?"
    gets.chomp
  end

  def new_meal_price
    puts "What is the meal meal price?"
    gets.chomp.to_i
  end

  def list(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name}: $#{meal.price}"
    end
  end
end
