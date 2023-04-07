k = gets.split[1].to_i
puts gets.chars.map{_1==?o ? (0>k-=1) ? ?x : _1 : _1}*''
