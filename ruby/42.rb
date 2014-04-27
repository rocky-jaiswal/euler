require 'csv'

def gen_triangle_numbers(n)
  (1..n).each_with_object([]) do |num, arr|
    arr << (num * (num + 1)) / 2
  end
end

#puts gen_triangle_numbers(100).inspect
nums = gen_triangle_numbers(100)
vals = ("A".."Z").zip(1..26).each_with_object({}){ |a, h| h[a.first] = a.last } #2.1 has to_h as well
count = 0

CSV.open("words.txt").each do |line|
  line.each do |word|
    sum = word.split(//).map{|l| vals[l.to_s]}.reduce(:+)
    count += 1 if nums.include?(sum)
  end
end

puts count
