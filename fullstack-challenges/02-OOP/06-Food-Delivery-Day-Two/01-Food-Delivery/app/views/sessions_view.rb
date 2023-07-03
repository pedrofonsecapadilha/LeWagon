class SessionsView
  def ask_username
    puts "Employee username?"
    print "> "
    gets.chomp
  end

  def ask_password
    puts "Employee password?"
    print "> "
    gets.chomp
  end

  def wrong_credentials
    puts "Something wrong! Try again"
  end

  def list(employees)
    employees.each do |employee|
      puts "#{employee.id} - #{employee.username} | Role: #{employee.role}"
    end
  end
end
