# Controller: it will fetch and store data of the Model, and tell the view to show or gather data to and from the user.

class Controller
  # initialize(cookbook) takes an instance of the Cookbook as an argument.
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  # list all the recipes
  def list
    recipes = @cookbook.all
    @view.display_list(recipes)
  end

  # create a new recipe
  def create
    new_name = @view.view_ask_recipe_name
    new_description = @view.view_ask_recipe_description
    new_recipe = Recipe.new(new_name, new_description)
    @cookbook.add_recipe(new_recipe)
  end

  # destroy an existing recipe
  def destroy
    list
    index = @view.ask_index
    @cookbook.remove_recipe(index.to_i)
  end
end
