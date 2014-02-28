(1..1000).to_a.each do |a|
  (1..1000).to_a.each do |b|
    (1..1000).to_a.each do |c|
      next if a + b + c != 1000
      if a*a + b*b == c*c
        puts "#{a}, #{b} and #{c}" 
        puts a * b * c 
        exit
      end
    end
  end
end