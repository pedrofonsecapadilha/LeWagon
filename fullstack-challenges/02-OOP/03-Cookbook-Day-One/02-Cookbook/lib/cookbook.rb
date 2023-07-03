require 'csv'

class Cookbook
  # 1. initialize(csv_file_path) which loads existing Recipe from the CSV
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = load_csv
  end

  # 2. all which returns all the recipes
  def all
    @recipes
  end

  # 3. add_recipe(recipe) which adds a new recipe to the cookbook
  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  # 4. remove_recipe(recipe_index) which removes a recipe from the cookbook.
  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  private

  def load_csv
    recipes = []
    CSV.foreach(@csv_file_path) do |row|
      new_recipe = Recipe.new(row[0], row[1])
      recipes << new_recipe
    end
    recipes
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
