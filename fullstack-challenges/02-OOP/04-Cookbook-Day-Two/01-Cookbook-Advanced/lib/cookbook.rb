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

  def mark_as_done(index)
    recipe = @recipes[index]
    recipe.done!
    save_csv
  end

  def internet_search(search)
    # Make an HTTP request to the recipe’s website with our keyword
    url = "https://www.tudoreceitas.com/pesquisa?q=#{search}"
    Nokogiri::HTML(URI.open(url).read, nil, "utf-8")
  end

  def first_five(doc)
    # Parse the HTML document to extract the first 5 recipes suggested and store them in an Array
    elements = doc.search(".titulo--resultado")
    all_recipes = []
    elements.each do |element|
      # if element.text.start_with?("Receita")
      #   # adiciona na lista as receitas
        all_recipes << element.text
      #end
    end
    all_recipes.first(5)
  end

  def rating(doc, index)
    if doc.search(".resultado.link")[index].search(".valoracion").first == nil
      0
    else
      (doc.search(".resultado.link")[index].search(".valoracion").first.attributes["style"].value[/(\d*)\./,1].to_f)/100*5
    end
  end

  private

  def load_csv
    recipes = []
    CSV.foreach(@csv_file_path) do |row|
      name = row[0]
      description = row[1]
      rating = row[2].to_f # alterei no live code
      prep_time = row[3]
      done = row[4] == 'true' # transforma a string recebida em booleano
      new_recipe = Recipe.new(name, description, rating, prep_time)
      new_recipe.done! if done
      recipes << new_recipe
    end
    recipes
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time, recipe.done?]
      end
    end
  end
end
