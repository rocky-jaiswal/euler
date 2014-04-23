def find_coprime_pairs(n=32)
  coprimes = []
  (1..n).each do |m|
    (1..n).each do |o|
      break if m < o || m == o
      coprimes << [m, o] if m.gcd(o) == 1
    end
  end
  coprimes
end

def all_multiples(triplet)
  muls = [triplet]
  n = 2
  while(muls.last.reduce(:+) < 1001)
    muls << triplet.map{|e| e * n}
    n = n + 1
  end
  muls
end

def find_triplets(pairs)
  arr = []
  pairs.each do |pair|
    arr = arr + all_multiples([pair.first ** 2 - pair.last ** 2, 2 * pair.first * pair.last, pair.first ** 2 + pair.last ** 2])
  end
  arr
end

all_pairs = find_coprime_pairs.uniq{|a| a.sort}
all_triplets = find_triplets(all_pairs).uniq{|a| a.sort}

collective = all_triplets.select{|a, b, c| a + b + c < 1001}.each_with_object({}) do |triplet, hash|
  puts triplet.inspect if triplet.reduce(:+) == 840
  sum = triplet.reduce(:+)
  if hash[sum].nil?
    hash[sum] = 1
  else
    hash[sum] = hash[sum] + 1 if hash[sum]
  end
end

max = collective.values.max
puts collective.select{|k, v| v == max}.inspect
