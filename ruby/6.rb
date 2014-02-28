sum_of_first_hundred = (1..100).to_a.reduce(:+)
sq_of_sum = sum_of_first_hundred * sum_of_first_hundred
sum_of_sq = (1..100).to_a.inject(0) {|sum, num| sum + (num * num)}

puts sq_of_sum
puts sum_of_sq

puts (sq_of_sum - sum_of_sq).abs