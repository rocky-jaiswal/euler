perms = (0..9).to_a.permutation

puts perms.map{|a| a.join}[1000000-1].inspect