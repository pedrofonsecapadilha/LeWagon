class MealView
  def new_meal_name
    puts "What is the new meal name?"
    print "> "
    gets.chomp
  end

  def new_meal_price
    puts "What is the new meal price?"
    print "> "
    gets.chomp.to_i
  end

  def list(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name}: $#{meal.price}"
    end
  end
end
