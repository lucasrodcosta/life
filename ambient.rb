class Ambient
  attr_reader :matrix

  DEFAULT_ELEM = "-"

  def initialize(height, width)
    @height = height
    @width = width

    @matrix = Array.new(height, DEFAULT_ELEM) {
      Array.new(width, DEFAULT_ELEM)
    }
  end

  def is_free?(x, y)
    raise ArgumentError, "Invalid coordinates" if (x < 0) || (x > @width) || (y < 0) || (y > @height)

    @matrix[x][y] == DEFAULT_ELEM
  end

  def insert(elem, x, y)
    raise ArgumentError, "Invalid coordinates" if (x < 0) || (x > @width) || (y < 0) || (y > @height)

    if is_free?(x, y)
      @matrix[x][y] = elem
      return true
    end

    false
  end

  def to_s
    @matrix.map { |row| row.join(" ") }.join("\n")
  end

end