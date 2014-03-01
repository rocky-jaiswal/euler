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
  def initialize(x, y)
    @x = x
    @y = y
  end

  def possible_moves_for(path)
    cells = []
    cell = path.cells.last
    cells << Cell.new(cell.x+1, cell.y) if cell.x+1 <= @x
    cells << Cell.new(cell.x, cell.y+1) if cell.y+1 <= @y
    cells
  end

  def destination
    Cell.new(@x, @y)
  end

  def advance(paths)
    result = []
    paths.each do |path|
      cells = self.possible_moves_for(path)
      result << cells.map do |cell|
        Path.path_from(path, cell)
      end
    end
    result.flatten
  end
end

class Path
  attr_reader :cells
  
  def initialize(cells = nil)
    @cells = [] if cells.nil?
    @cells = cells if !cells.nil?
  end

  def add_cell(cell)
    @cells << cell
  end

  def self.path_from(path, cell)
    #puts "creating path from #{path.cells} and #{cell}"
    p = Path.new(path.cells.clone)
    p.add_cell cell
    p
  end
end

matrix = Matrix.new(5, 5)
start_at = Cell.new(0, 0)
paths = []
done = false

path = Path.new
path.add_cell(start_at)
paths << path

while !done
  paths = matrix.advance(paths)
  #puts "-------------->"
  #puts paths.inspect
  #paths.each {|p| puts "#{p.cells}"}  
  done = paths.all?{|p| p.cells.last == matrix.destination}
end
puts paths.size