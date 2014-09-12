module Palindrome
  def is_palindrome?
    self.to_s == self.to_s.reverse
  end
end

class Fixnum
  include Palindrome

  def to_binary
    self.to_s(2)
  end
end

class String
  include Palindrome
end

palindromes = []
(1..1000000).each do |num|
  palindromes << num if num.is_palindrome? && num.to_binary.is_palindrome?
end
puts palindromes.reduce(:+)
