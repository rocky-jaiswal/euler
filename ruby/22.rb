require 'csv'

def get_value(str, hash)
  str.chomp.strip.downcase.split(//).map{|c| hash[c]}.reduce(:+)
end

names = File.open("names.txt") do |f| 
  line = f.gets
  CSV.parse(line)
end.flatten

hash = ("a".."z").zip(1..26).to_h

vals = names.sort.each_with_index.map do |name, idx|
  get_value(name, hash) * (idx + 1)
end

puts vals.reduce(:+)