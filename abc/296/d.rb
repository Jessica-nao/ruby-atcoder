n, m = gets.split.map(&:to_i)
sup = 10 ** 12 + 1
ans = sup
1.upto(n) do |a|
  b = (m + a - 1) / a
  break if b < a
  next if b > n

  ans = [ans, a * b].min
end

puts ans < sup ? ans : -1
