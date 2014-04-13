class Spiral

  class Cell
    attr_accessor :val
    attr_reader :x, :y

    def initialize(x, y)
      @val = nil
      @x = x
      @y = y
    end

    def right
      [@x, @y + 1]
    end

    def down
      [@x + 1, @y]
    end

    def left
      [@x, @y - 1]
    end

    def up
      [@x - 1, @y]
    end

    def distance(x, y)
      [@x - x, @y = y]
    end

  end

  DIRECTIONS = [:right, :down, :left, :up]

  def initialize(size)
    @size = size
    @matrix = Array.new(@size)
    (0...@size).each_with_index{|m| @matrix[m] = Array.new(@size)}

    @value = 1
    @center_cell = Cell.new(center, center)
    @center_cell.val = @value

    @current_pos = @center_cell
    @direction = 0
    @radius = 1
    @matrix[@center_cell.x][@center_cell.y] = @center_cell
  end

  def print_matrix
    @matrix.each do |m|
      m.each do |e|
        if e.nil?
          print " _ "
        else
          print " #{e.val} "
        end
      end
      puts ""
    end
  end

  def center
    (@size - 1) / 2
  end

  def can_move?(direction)
    #puts "======================"
    nx, ny = @current_pos.send(direction)
    if @matrix[nx].nil? || @matrix[nx][ny].nil?
      #puts direction
      #puts nx
      #puts ny
      #puts @current_pos.x
      #puts @current_pos.y
      if nx == @center_cell.x - @radius && ny == @center_cell.y + @radius
        @radius = @radius + 1
        return true
      end
      (nx - @center_cell.x).abs <= @radius && (ny - @center_cell.y).abs <= @radius
    end
  end

  def change_direction
    if @direction < 3
      @direction = @direction + 1
    else
      @direction = 0
    end
  end

  def get_direction
    if can_move? DIRECTIONS[@direction]
      DIRECTIONS[@direction]
    else
      change_direction
      DIRECTIONS[@direction]
    end
  end

  def move
    direction = get_direction
    #puts direction
    nx, ny = @current_pos.send(direction)
    cell = Cell.new(nx, ny)
    @value = @value + 1
    cell.val = @value
    @current_pos = cell
    @matrix[cell.x][cell.y] = cell
  end

  def play
    (@size*@size-1).times do
      move
      #print_matrix
    end
  end

  def sum
    sum = 0
    (0...@size).each do |i|
      sum = sum + @matrix[i][i].val
    end
    (0...@size).each do |i|
      (0...@size).each do |j|
        sum = sum + @matrix[i][j].val if i != j && i + j + 1 == @size
      end
    end
    sum
  end

end

s = Spiral.new(1001)
s.play
puts s.sum
