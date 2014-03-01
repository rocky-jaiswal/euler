class Cell
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def ==(other)
    other.is_a?(Cell) && other.x == self.x && other.y == self.y
  end

  def to_s
    "#{x}, #{y}"
  end
end

class Matrix
  attr_reader :paths
  
  def initialize(x, y)
    @x = x
    @y = y
    @paths = 0
  end

  def possible_moves_for(cell, path)
    #puts "calling for #{cell}"
    if cell.x == @x && cell.y == @y
      @paths += 1
      #puts path.inspect
      #path.clear
    end
    if cell.x+1 <= @x
      n = Cell.new(cell.x+1, cell.y)
      path << n
      possible_moves_for(n, path)
    end
    if cell.y+1 <= @y
      n = Cell.new(cell.x, cell.y+1)
      path << n
      possible_moves_for(n, path)
    end
  end
end

matrix = Matrix.new(5, 5)
start_cell = Cell.new(0, 0)
matrix.possible_moves_for(start_cell, [])
puts matrix.paths
