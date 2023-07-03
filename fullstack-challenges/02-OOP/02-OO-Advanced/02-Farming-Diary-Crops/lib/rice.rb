# TODO: code the Rice class

require_relative "crop"
class Rice < Crop
  attr_reader :grains

  # initialize sets the instance variable @grains to zero.
  # def initialize
  #   @grains = 0
  # end

  # water!: adds 10 grains anytime it is called.
  def water!
    @grains += 5
  end

  # # ripe? returns true if there are at least 15 grains.
  # def ripe?
  #   @grains > 15
  # end

  def transplant!
    @grains += 10
  end
end
