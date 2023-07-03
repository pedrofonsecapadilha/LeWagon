class CustomerView
  def new_customer_name
    puts "What is the new customer name?"
    gets.chomp
  end

  def new_customer_address
    puts "What is the new customer address?"
    gets.chomp
  end

  def list(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name}: $#{customer.address}"
    end
  end
end
