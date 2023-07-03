class CustomerView
  def new_customer_name
    puts "What is the new customer name?"
    print "> "
    gets.chomp
  end

  def new_customer_address
    puts "What is the new customer address?"
    print "> "
    gets.chomp
  end

  def list(customers)
    customers.each do |customer|
      puts "#{customer.id}. #{customer.name} - #{customer.address}"
    end
  end
end
