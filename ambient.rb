class Ambient
  attr_reader :cells

  DEFAULT_ELEM = "-"

  def initialize(height, width)
    @height = height
    @width = width

    @grid = Array.new(height, DEFAULT_ELEM) {
      Array.new(width, DEFAULT_ELEM)
    }

    @cells = []
  end

  def is_free?(x, y)
    return false unless check_grid_coordinates(x, y)

    @grid[x][y] == DEFAULT_ELEM
  end

  def insert_cell(cell, x, y)
    raise ArgumentError, "Invalid coordinates" unless check_grid_coordinates(x, y)
    raise ArgumentError, "First argument must be a Cell" unless cell.is_a? Cell

    if is_free?(x, y)
      @grid[x][y] = cell
      @cells << cell
      cell.ambient = self
      cell.position_x = x
      cell.position_y = y
      return true
    end

    false
  end

  def move_cell(start_x, start_y, end_x, end_y)
    if is_free?(end_x, end_y) && check_grid_coordinates(end_x, end_y)
      cell = @grid[start_x][start_y]
      @grid[start_x][start_y] = DEFAULT_ELEM

      @grid[end_x][end_y] = cell
      return true
    end

    false
  end

  def insert_food(food, x, y)
    raise ArgumentError, "Invalid coordinates" unless check_grid_coordinates(x, y)
    raise ArgumentError, "First argument must be a Food" unless cell.is_a? Food

    if is_free?(x, y)
      @grid[x][y] = food
      return true
    end

    false
  end

  def to_s
    @grid.map { |row| row.join(" ") }.join("\n")
  end


  private
  # return true if (x,y) is a valid coordinate on grid
  def check_grid_coordinates(x, y)
    (x >= 0) && (x < @height) && (y >= 0) && (y < @width)
  end

end