require_relative '../models/meal'
require_relative '../views/meal_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def add
    new_name = @meal_view.new_meal_name
    new_price = @meal_view.new_meal_price
    new_meal = Meal.new(name: new_name, price: new_price)
    @meal_repository.create(new_meal)
  end

  def list
    @meal_view.list(@meal_repository.all)
  end
end
