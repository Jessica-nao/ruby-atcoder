s = gets.chomp.tr('?()', '012').chars.map(&:to_i)
n = s.size
dp = Array.new(n, 0)

s.each_with_index do |c, i|
  dp_pre = dp
  dp = Array.new(n, 0)
  if i == 0
    dp[1] = 1 if c < 2
    next
  end

  n.times do |j|
    next if (i+j).even?

    dp[j] = if c == 1 && j > 0
              dp_pre[j-1]
            elsif c == 2 && j < n-1
              dp_pre[j+1]
            elsif c == 0
              tmp = j > 0 ? dp_pre[j-1] : 0
              tmp += dp_pre[j+1] if j < n-1
              tmp % 998244353
            else
              0
            end
  end
end

puts dp[0]
