n = gets.to_i
s = gets.chomp

zero_one_count = Array.new(n) { Array.new(2, 0) }
ans = 0
n.times do |i|
  pre_zero_count = i > 0 ? zero_one_count[i - 1][0] : 0
  pre_one_count = i > 0 ? zero_one_count[i - 1][1] : 0

  if s[i] == '0'
    zero_one_count[i][0] = 1
    zero_one_count[i][1] = i
  else
    zero_one_count[i][0] = pre_one_count
    zero_one_count[i][1] = pre_zero_count + 1
  end

  ans += zero_one_count[i][1]
end

# pp zero_one_count
puts ans
