max = (9 ** 5) * 5
arr = (2..max).select do |n|
  sum = 0
  sum_4 = n.to_s.split(//).inject(sum){|sum, e| sum + (e.to_i ** 5)}
  sum_4 == n
end

puts arr.reduce(:+)
