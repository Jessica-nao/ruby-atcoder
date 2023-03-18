n = gets.to_i
call_map = gets.split.map{ |i| i.to_i - 1 }
has_called = [false] * n

0.upto(n-1).each do |i|
  next if has_called[i]
  call_target = call_map[i]
  has_called[call_target] = true
end

not_called_members = 1.upto(n).to_a.filter { |i| !has_called[i-1] }
puts not_called_members.size
puts not_called_members.join(' ')
