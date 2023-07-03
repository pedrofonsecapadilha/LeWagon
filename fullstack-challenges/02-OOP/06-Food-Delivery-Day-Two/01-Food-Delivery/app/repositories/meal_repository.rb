# create a new meal
# Get all the meals
# find a specific meal thanks to its id

require_relative "../models/meal" # QUANDO FAZERMOS O APP PODEMOS RETIRAR ESSA LINHA POIS TUDO ESTARÁ NO .APP
require 'csv'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(csv_file)
  end

  def create(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save_csv
  end

  def all
    @meals
  end

  def find(id)
    @meals.find do |meal|
      meal.id == id
    end
  end

  private

  def save_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << %w[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name] # NÃO PRECISA COLOCAR POIS JÁ É UMA STRING
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.empty? ? 1 : (@meals.last.id + 1)
  end
end
