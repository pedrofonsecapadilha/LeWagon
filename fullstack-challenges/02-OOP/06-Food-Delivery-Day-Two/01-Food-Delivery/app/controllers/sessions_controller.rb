require_relative '../models/employee'
require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def sign_in
    username = @sessions_view.ask_username
    password = @sessions_view.ask_password
    employee = @employee_repository.find_by_username(username)

    if employee && employee.password == password
      return employee
    else
      @sessions_view.wrong_credentials
      sign_in
    end
  end
end
