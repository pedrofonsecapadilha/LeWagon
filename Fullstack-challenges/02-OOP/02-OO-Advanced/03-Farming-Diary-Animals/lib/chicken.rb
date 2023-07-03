require_relative "animal"

class Chicken < Animal
  attr_reader :eggs

  def initialize(gender)
    super()
    @gender = gender
    @eggs = 0
  end

  def talk
    if @gender == "female"
      "cluck cluck"
    else
      "cock-a-doodle-doo"
    end
  end

  def feed!
    super
    if @gender == "female"
      @eggs += 2
    else
      @eggs += 0
    end
  end
end
