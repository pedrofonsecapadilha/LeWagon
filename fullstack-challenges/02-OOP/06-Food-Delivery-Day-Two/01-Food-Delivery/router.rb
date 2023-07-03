# TODO: implement the router of your app.

class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    print "\n"
    puts "----------  FOOD DELIVERY!  ----------"
    puts "            --------------            "
    print "\n"

    @employee = @sessions_controller.sign_in

    while @running
      @employee.manager? ? display_tasks_manager : display_tasks_rider

      action = ask_action

      print "\n"
      @employee.manager? ? route_action_manager(action) : route_action_rider(action)
    end
  end

  private

  def ask_action
    puts "What do you want to do next?"
    print "> "
    gets.chomp.to_i
  end

  def display_tasks_manager
    print "\n"
    puts "--------------------------------------"
    puts "1 - Add a meal"
    puts "2 - List all avaiable meals"
    puts "--------------------------------------"
    puts "3 - Add a customer"
    puts "4 - List all avaiable customers"
    puts "--------------------------------------"
    puts "5 - Add a new order"
    puts "6 - List all undelivered orders"
    puts "--------------------------------------"
    puts "9 - Stop and exit the program"
    puts "--------------------------------------"
    print "\n"
  end

  def route_action_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @orders_controller.add
    when 6 then @orders_controller.list_undelivered_orders
    when 9 then @running = false
    else
      puts "Wrong action! Try again"
    end
  end

  def display_tasks_rider
    print "\n"
    puts "--------------------------------------"
    puts "1 - List my undelivered oders"
    puts "2 - Mark oders as done (delivered)!"
    puts "--------------------------------------"
    puts "9 - Stop and exit the program"
    puts "--------------------------------------"
    print "\n"
  end

  def route_action_rider(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 9 then @running = false
    else
      puts "Wrong action! Try again"
    end
  end
end
