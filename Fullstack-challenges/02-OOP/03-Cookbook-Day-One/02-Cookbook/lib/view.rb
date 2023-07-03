# View: this is the place where we display information to the user (puts) and ask for information from the user (gets)
# The view is responsible for all the puts and gets of your MVC. Make sure you never have those words anywhere else!
# (except maybe for debugging)

class View
  # display_list
  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name}: #{recipe.description}"
    end
  end

  def view_ask_recipe_name
    puts "Enter de recipe name:"
    gets.chomp
  end

  def view_ask_recipe_description
    puts "Enter de recipe description:"
    gets.chomp
  end

  def ask_index
    puts "Enter index:"
    gets.chomp.to_i - 1
  end
end
