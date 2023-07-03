# TODO: implement the router of your app.

class Router
  # def initialize(controller)
  #   @controller = controller
  #   @running    = true
  # end
  def initialize
    @running = true
  end

  def run
    puts "----------  FOOD DELIVERY!  ----------"
    puts "            --------------            "

    while @running
      puts "Choose one action:"
      # display_tasks
      action = gets.chomp.to_i
      # print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then stop
    when 2 then stop
    when 3 then stop
    when 4 then stop
    when 5 then stop
    when 6 then stop
    else
      puts "Please press 1, 2, 3, 4, 5 or 6"
    end
  end

  # def stop
  #   @running = false
  # end

  # def display_tasks
  #   puts ""
  #   puts "What do you want to do next?"
  #   puts "1 - List all recipes"
  #   puts "2 - Create a new recipe"
  #   puts "3 - Destroy a recipe"
  #   puts "4 - Import recipes from the Internet"
  #   puts "5 - Mark recipe as done"
  #   puts "6 - Stop and exit the program"
  # end
end
