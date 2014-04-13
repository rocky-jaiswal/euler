class FibG

  def initialize
    @lastFib = 1
    @secondLastFib = 1
  end

  def fib_memo(n)
    return 1 if n == 1 || n == 2
    result = @lastFib + @secondLastFib
    @secondLastFib = @lastFib
    @lastFib = result
    result
  end

  def fib(n)
    r = 0
    (1..n).each_with_index do |_, i|
      r = fib_memo(i+1)
    end
    r
  end

end

ans = nil
(1500..Float::INFINITY).lazy.each do |n|
  if FibG.new.fib(n).to_s.split(//).length >= 1000
    ans = n
    break
  end
end

puts ans
