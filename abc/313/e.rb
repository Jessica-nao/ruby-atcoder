n = gets.to_i
s = gets.chomp

if s.match?(/[2-9]{2,}/)
  puts 0-1
  exit
end

ans = 0
pre_c = 0
s.chars.reverse.each do |c|
  c = c.to_i
  ans += (ans * (pre_c - 1)) + 1
  ans %= 998244353
  pre_c = c
end

puts ans - 1
