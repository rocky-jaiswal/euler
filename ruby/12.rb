require 'prime'

class TriangleNumber
    def initialize
        @last = 0
    end

    def get(num)
        if @last == 0
          @last = (1..num).to_a.reduce(:+)
        else
          @last = @last + num
        end
        @last
    end
end

def number_of_divisors(num)
  num.prime_division.inject(1){|s, a| s * (a[1] + 1)}
end

tn = TriangleNumber.new

(1..100000).to_a.each do |num|
  triangular_number = tn.get(num)
  nod = number_of_divisors(triangular_number)
  puts triangular_number if nod > 500
  break if nod > 500
end
