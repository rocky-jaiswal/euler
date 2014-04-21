max = (9 ** 5) * 7
arr = (2..max).select do |n|
  sum_4 = n.to_s.split(//).inject(0){|sum, e| sum + (e.to_i ** 5)}
  sum_4 == n
end

puts arr.reduce(:+)
