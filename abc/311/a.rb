n = gets.to_i
s = gets.chomp
ans = 0
['A', 'B', 'C'].each do |c|
  ans = [s.index(c), ans].max
end
puts ans + 1
