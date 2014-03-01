class Cell(val x: Int, val y: Int)

class Matrix(val x: Int, val y: Int) {
  var paths: Int = 0

  def possible_moves_for(cell: Cell, path: Array[Cell]) {
    if(cell.x == this.x && cell.y == this.y) {
      paths = paths + 1
    }
    if(cell.x+1 <= this.x) {
      val n = new Cell(cell.x+1, cell.y)
      possible_moves_for(n, path :+ n)
    }
    if(cell.y+1 <= this.y) {
      val n = new Cell(cell.x, cell.y+1)
      possible_moves_for(n, path :+ n)
    }
  }
}

val m = new Matrix(5,5)
val c = new Cell(0,0)
m.possible_moves_for(c, Array())
m.paths