class Food
  attr_reader :calorie

  def initialize
    @calorie = 1 + Random.rand(5)
  end

  def is_alive?
    @calorie > 0
  end

  def destroy
    @calorie = 0
  end

  def to_s
    return "o" if is_alive?
    nil
  end

end