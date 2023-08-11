n, m = gets.split.map(&:to_i)

parents = [0] + gets.split.map{ _1.to_i - 1 }

dp = Array.new(n, -1)

m.times.each do
  x, y = gets.split.map(&:to_i)
  dp[x-1] = [dp[x-1], y].max
end

n.times do |i|
  dp[i] = [dp[i], dp[parents[i]] - 1].max
end

puts dp.count{ _1 >= 0 }
