require_relative "../views/meal_view"
require_relative "../views/customer_view"
require_relative "../views/sessions_view"
require_relative "../views/orders_view"

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @meal_view = MealView.new
    @customer_view = CustomerView.new
    @sessions_view = SessionsView.new
    @orders_view = OrdersView.new
  end

  def add
    meals = @meal_repository.all
    @meal_view.list(meals)
    index = @orders_view.ask_for_index
    meal = meals[index]

    customers = @customer_repository.all
    @customer_view.list(customers)
    index = @orders_view.ask_for_index
    customer = customers[index]

    employees = @employee_repository.all_riders
    @sessions_view.list(employees)
    index = @orders_view.ask_for_index
    employee = employees[index] # EXISTE UM ERRO AQUI, TERIA QUE SEPARAR A LISTA DE EMPLOYEES EM 2 (MANAGER / RIDER)

    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @orders_view.display(undelivered_orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    index = @orders_view.ask_for_index
    my_orders = @order_repository.my_undelivered_orders(employee)
    order = my_orders[index]
    @order_repository.mark_as_delivered(order)
  end

  def list_my_orders(employee)
    undelivered_orders = @order_repository.my_undelivered_orders(employee)
    @orders_view.display(undelivered_orders)
  end
end
