class SimpleSieve

  def get_primes_upto(num)
    @num = num
    hash = (2..@num).each_with_object({}) {|i, h| h[i] = true}
    sieve_hash(hash)
  end

  private

  def sieve_hash(hash)
    sqrt_n = Math.sqrt(@num).to_i
    (2..sqrt_n).each do |i|
      if hash[i]
        multiples = get_multiples(i, @num)
        multiples.each {|j| hash[j] = false}
      end
    end
    hash.reject{|k,v| !v}.map{|k, _| k}
  end

  def get_multiples(n, max)
    arr = []
    mul = 0
    e = n * n + mul * n
    while e <= max
      arr << e
      mul += 1
      e = n * n + mul * n
    end
    arr
  end

end
