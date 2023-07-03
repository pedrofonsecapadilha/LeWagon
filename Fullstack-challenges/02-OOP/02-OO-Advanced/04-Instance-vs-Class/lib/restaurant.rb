class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :city, :name
  attr_accessor :average_rating

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @average_rating = 0
    @rate = []
  end

  # TODO: implement .filter_by_city and #rate methods
  def rate(new_rate)
    @rate << new_rate
    average = @rate.map(&:to_f).sum / @rate.size
    @average_rating = average
  end

  def self.filter_by_city(restaurants, city)
    # that returns all the restaurants in a given city (this return should be an array of restaurant objects)
    restaurants.select do |restaurant|
      restaurant if restaurant.city == city
    end
  end
end
