class Cell
  attr_reader :health, :hunger_threshold

  def initialize
    @health = 10 + Random.rand(11)
    @hunger_threshold = 11
  end

  def is_alive?
    @health > 0
  end

  def needs_to_feed?
    @health < @hunger_threshold
  end

  def eat(food)
    raise ArgumentError, "A cell only eats Food" unless food.is_a? Food

    @health += food.calorie
    food.destroy
  end

  def to_s
    return "@" if is_alive?
    nil
  end

end