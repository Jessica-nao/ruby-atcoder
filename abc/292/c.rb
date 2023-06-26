n = gets.to_i

divisor_count = [0] * (n + 1)

1.upto(n) do |i|
  1.upto(n) do |j|
    break if i * j > n
    divisor_count[i*j] += 1
  end
end

ans = 0
1.upto(n-1) do |i|
  ans += divisor_count[i] * divisor_count[n-i]
end

puts ans
