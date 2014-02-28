def get_sequence(num)
  seq = []
  while(true)
    seq << num
    break if num == 1
    if num % 2 == 0
      num = num / 2
    else
      num = 3 * num + 1
    end
  end
  seq
end

puts (70000..1000000).map{|n| get_sequence(n)}.max_by{|seq| seq.size}.first