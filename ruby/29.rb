arr = []

(2..100).each do |n1|
  (2..100).each do |n2|
    arr << n1 ** n2
  end
end

puts arr.uniq.sort.size
