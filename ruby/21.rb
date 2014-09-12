def sum_of_divisors(number)
  (1...number).select{|n| number % n == 0}.reduce(:+)
end

amic_nums = []
(2..10000).each do |num|
  sum = sum_of_divisors(num)
  amic_nums = amic_nums + [sum, num] if sum != num && sum_of_divisors(sum) == num
end

puts amic_nums.uniq.reduce(:+)
