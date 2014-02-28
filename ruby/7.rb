require_relative 'simple_sieve'

s = SimpleSieve.new
primes = s.get_primes_upto(110000) #this was a guess
puts primes[10000]