def fibonacci(range)
  fibs = []
  fibs[0] = 1
  fibs[1] = 2
  while (fibs[-1] + fibs[-2]) < range
    fibs << fibs[-1] + fibs[-2]
  end
  fibs
end

puts fibonacci(4000000).select{|n| n % 2 == 0}.reduce(:+)