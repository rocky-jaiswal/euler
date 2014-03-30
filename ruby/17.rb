NAMES = {
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen",
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety",
  100 => "one hundred",
  1000 => "one thousand"
}

def build_num_name(num)
  digits = num.to_s.split(//)
  if num < 100
    NAMES[digits[0].to_i * 10] + " " + NAMES[digits[1].to_i]
  else
    if digits[1] == "1"
      NAMES[digits[0].to_i] + " hundred and " + NAMES[(digits[1] + digits[2]).to_i]
    elsif num % 100 == 0
      NAMES[digits[0].to_i] + " hundred"
    else
      second = NAMES[digits[1].to_i * 10] || "" #zero
      third = NAMES[digits[2].to_i] || "" #zero
      NAMES[digits[0].to_i] + " hundred and " + second + " " + third
    end
  end
end

def len(name)
  name.split(//).select{|n| n != " " && n != "-"}.length
end

num_names = (1..1000).map do |n|
  NAMES[n] || build_num_name(n)
end

#puts num_names.inspect
puts num_names.map{ |nn| len(nn) }.reduce(:+)

