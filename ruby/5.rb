def is_divisible?(num)
  (1..20).all? { |d| num % d == 0 }
end

num = 380 # 19*20
mul = 1

while true
  if is_divisible?(num)
    puts num
    exit
  else
    mul = mul + 1
    num = 380 * mul
  end
end