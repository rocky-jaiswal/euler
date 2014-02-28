require_relative 'simple_sieve'

s = SimpleSieve.new
primes = s.get_primes_upto(2000000)
puts primes.reduce(:+)