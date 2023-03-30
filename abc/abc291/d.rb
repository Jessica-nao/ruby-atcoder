n = gets.to_i
mod = 998244353

cards = n.times.map do
  gets.split.map(&:to_i)
end
dp = Array.new(n) { Array.new(2, 0) }
dp[0] = [1, 1]

1.upto(n-1).each do |i|
  2.times do |j|
    2.times do |k|
      dp[i][j] += dp[i-1][k] if cards[i][j] != cards[i-1][k]
      dp[i][j] %= mod
    end
  end
end

puts dp[-1].sum % mod
