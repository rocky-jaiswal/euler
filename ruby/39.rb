#jruby -J-Xmn1024m -J-Xms2048m -J-Xmx2048m -J-server 39.rb

class Sides
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def ==(other)
    other.is_a?(Sides) && [other.a, other.b, other.c].sort == [self.a, self.b, self.c].sort  
  end

  def eql?(other)
    other.is_a?(Sides) && [other.a, other.b, other.c].sort.eql?([self.a, self.b, self.c].sort)
  end

  def hash
    [self.a, self.b, self.c].sort.hash
	end

  def sorted
    [self.a, self.b, self.c].sort
  end
end

def build_all_combos(n)
  combos = []
  max = (n / Math.sqrt(2)).ceil
  (1..max).each do |n1|
    (1..max).each do |n2|
      break if n1 + n2 > max
      (1..max).each do |n3|
        break if (n1 + n2 + n3) > max
        combos << Sides.new(n1, n2, n3) if (n1 + n2 + n3) == max
      end
    end
  end
  combos.uniq
end

def solve(range)
  range.each_with_object({}) do |n, map|
    puts "processing #{n}..."
    slices = build_all_combos(n).select do |slice|
      sorted = slice.sorted
      sorted[2] ** 2 == sorted[0] ** 2 + sorted[1] ** 2
    end
    map[n] = slices.size
  end
end

#  1..200 => {120=>3, 168=>3, 180=>3}
#201..300 => {240=>4, 252=>3, 280=>3}
#301..400 => {360=>4}
#401..500 => {474=>3, 475=>3}
#501..600 => {508=>4, 509=>4}
#601..700 => {678=>4}
#701..800 => {712=>4}
#801..900 => {890=>4}
#901..1000 =>{932=>5, 933=>5}

n = 900

t1 = Thread.new do 
 slice = solve(n+1..n+20)
 max = slice.values.max
 puts slice.select{|k,v| v == max}.inspect
end

t2 = Thread.new do 
 slice = solve(n+21..n+40)
 max = slice.values.max
 puts slice.select{|k,v| v == max}.inspect
end

t3 = Thread.new do 
 slice = solve(n+41..n+60)
 max = slice.values.max
 puts slice.select{|k,v| v == max}.inspect
end

t4 = Thread.new do 
 slice = solve(n+61..n+80)
 max = slice.values.max
 puts slice.select{|k,v| v == max}.inspect
end

t5 = Thread.new do 
 slice = solve(n+81..n+90)
 max = slice.values.max
 puts slice.select{|k,v| v == max}.inspect
end

t6 = Thread.new do 
 slice = solve(n+91..n+100)
 max = slice.values.max
 puts slice.select{|k,v| v == max}.inspect
end

t1.join
t2.join
t3.join
t4.join
t5.join
t6.join
