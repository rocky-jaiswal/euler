def factorial(n)
  return 1 if n == 0
  return 1 if n == 1
  n * factorial(n -1)
end


def fact_hash
  facts = {}
  (0..9).each{ |n| facts[n] = factorial(n) }
  facts
end

FH = fact_hash

#puts FH.inspect

max = 9999999
arr = (3..max).select do |n|
  (n.to_s.split(//).inject(0){|sum, e| sum + FH[e.to_i]}) == n
end

puts arr.inspect
