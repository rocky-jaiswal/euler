def is_palindrome?(str)
  str == str.reverse
end

result = 11

(100..999).to_a.reverse.each do |no_1|
  (100..999).to_a.reverse.each do |no_2|
    #puts "Multiplying #{no_1} and #{no_2}"
    product = no_1 * no_2
    result  = product if is_palindrome?(product.to_s) && product > result
  end
end

puts result
