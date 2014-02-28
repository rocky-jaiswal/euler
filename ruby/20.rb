def factorial(n)
  return 1 if n == 1
  n * factorial(n -1)
end

factorial(100).to_s.split(//).map{|e| e.to_i}.inject(0){|s, e| s + e}