require_relative '../models/customer'
require_relative '../views/customer_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def add
    new_name = @customer_view.new_customer_name
    new_address = @customer_view.new_customer_address
    new_customer = Customer.new(name: new_name, address: new_address)
    @customer_repository.create(new_customer)
  end

  def list
    @customer_view.list(@customer_repository.all)
  end
end
