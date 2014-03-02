arr = []
(1..100).each do |i|
  (1..100).each do |j|
    arr << (i ** j).to_s.split(//).inject(0){ |sum, n| sum + n.to_i }
  end
end
arr.max