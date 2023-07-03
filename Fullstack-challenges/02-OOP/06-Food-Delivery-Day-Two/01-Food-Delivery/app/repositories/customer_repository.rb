require_relative "../models/customer" # QUANDO FAZERMOS O APP PODEMOS RETIRAR ESSA LINHA POIS TUDO ESTARÁ NO .APP
require 'csv'

class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 1
    load_csv if File.exist?(csv_file)
  end

  def create(customer)
    customer.id = @next_id
    @customers << customer
    @next_id += 1
    save_csv
  end

  def all
    @customers
  end

  def find(id)
    @customers.find do |customer|
      customer.id == id
    end
  end

  private

  def save_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << %w[id name address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name] # NÃO PRECISA COLOCAR POIS JÁ É UMA STRING
      row[:address] = row[:address] # NÃO PRECISA COLOCAR POIS JÁ É UMA STRING
      @customers << Customer.new(row)
    end
    @next_id = @customers.empty? ? 1 : (@customers.last.id + 1)
  end
end
