s = gets.chomp.chars.map(&:to_i)
x = [0] * 2050
num = 0
x[0] = 1

s.each do |i|
  pm = (num / (2**i)) % 2 == 0 ? 1 : -1
  num += (2 ** i) * pm
  x[num] += 1
end

ans = 0
x.each do |i|
  ans += (i - 1) * i / 2
end
puts ans
