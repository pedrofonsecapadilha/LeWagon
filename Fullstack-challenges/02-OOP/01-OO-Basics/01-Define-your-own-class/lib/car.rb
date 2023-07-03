class Car
  def initialize(brand, model, kilometers)
    @brand = brand
    @model = model
    @kilometers = kilometers
    @tested = false
  end

  def tested
    @tested = true
  end
end
