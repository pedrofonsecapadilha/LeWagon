# View: this is the place where we display information to the user (puts) and ask for information from the user (gets)
# The view is responsible for all the puts and gets of your MVC. Make sure you never have those words anywhere else!
# (except maybe for debugging)

class View
  # display_list
  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      done = recipe.done? ? '[X]' : '[ ]'
      puts "#{index + 1}. #{done} #{recipe.name}:\n #{recipe.description} | Preparation time: #{recipe.prep_time} (#{recipe.rating}/5.0)"
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

  def view_ask_recipe_rating
    puts "Enter de recipe rating [0-5]:"
    gets.chomp.to_f
  end

  def ask_index
    puts "Enter index:"
    gets.chomp.to_i - 1
  end

  def view_ask_prep_time
    puts "Enter how many time this recipe take? (Xh Xm)"
    gets.chomp
  end

  def view_import_search
    puts "What ingredient would you like a recipe for? (In portuguese)"
    gets.chomp.downcase
  end

  def display_internet_list(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe}"
    end
  end
end
