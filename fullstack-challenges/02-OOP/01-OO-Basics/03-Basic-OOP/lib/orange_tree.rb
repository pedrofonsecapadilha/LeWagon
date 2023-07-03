class OrangeTree
  attr_accessor :age, :height, :fruits, :dead

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
    @dead = false
  end

  def one_year_passes!
    @age += 1
    update_fruits
    update_height
    chances_to_die
    dead?
  end

  def update_height
    @height += 1 if @age <= 10
  end

  def update_fruits
    @fruits = 0
    case @age
    when (6..9)
      @fruits += 100
    when (10..14)
      @fruits += 200
    else
      @fruits = 0
    end
    @fruits
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits >= 1
  end

  def dead?
    @dead
  end

  def chances_to_die
    sort = (@age..99).to_a
    chances = sort.sample if @age > 50 && @age < 100
    @dead = true if chances == @age
  end
end
