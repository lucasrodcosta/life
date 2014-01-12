class Cell
  attr_reader :health, :hunger_threshold
  attr_accessor :ambient, :position_x, :position_y

  def initialize
    @health = 10 + Random.rand(11)

    # TODO: the hunger_threshold will be a time function
    @hunger_threshold = 11

    # the specie of a cell is determined by his color
    @specie = Random.rand(7) + 31
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
    return "\e[#{@specie}m@\e[0m" if is_alive?
    nil
  end

  def move
    new_x = self.position_x + Random.rand(3) - 1
    new_y = self.position_y + Random.rand(3) - 1

    if self.ambient.move_cell(self.position_x, self.position_y, new_x, new_y)
      self.position_x = new_x
      self.position_y = new_y
    end

  end

end