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
    new_prep_time = @view.view_ask_prep_time
    new_rating = @view.view_ask_recipe_rating
    new_recipe = Recipe.new(new_name, new_description, new_rating, new_prep_time)
    @cookbook.add_recipe(new_recipe)
  end

  # destroy an existing recipe
  def destroy
    list
    index = @view.ask_index
    @cookbook.remove_recipe(index.to_i)
  end

  def mark_as_done
    list
    index = @view.ask_index
    @cookbook.mark_as_done(index)
  end

  def import
    # Ask a user for a keyword to search
    search = @view.view_import_search

    # Make an HTTP request to the recipe’s website with our keyword
    doc = @cookbook.internet_search(search)

    # Parse the HTML document to extract the first 5 recipes suggested and store them in an Array
    five_recipes = @cookbook.first_five(doc)

    # Display them in an indexed list
    @view.display_internet_list(five_recipes)

    # Ask the user which recipe they want to import (ask for an index)
    puts "Which recipe you want to import?"
    index = @view.ask_index

    # Add it to the Cookbook
    name = five_recipes[index]
    description = "#{doc.search(".intro")[index].text[0, 60].gsub("\n", "")}..."
    rating = @cookbook.rating(doc, index)
    prep_time = doc.search(".duracion")[index].text
    new_recipe = Recipe.new(name, description, rating, prep_time)
    @cookbook.add_recipe(new_recipe)
  end
end
