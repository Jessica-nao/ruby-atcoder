s = gets.chomp.chars
n = s.size
dp = Array.new(n, 0)

s.each_with_index do |c, i|
  dp_pre = dp
  dp = Array.new(n, 0)
  if i == 0
    dp[1] = 1 if ['(', '?'].include?(c)
    next
  end

  n.times do |j|
    next if (i+j).even?

    dp[j] = if c == '(' && j > 0
              dp_pre[j-1]
            elsif c == ')' && j < n-1
              dp_pre[j+1]
            elsif c == '?'
              tmp = j > 0 ? dp_pre[j-1] : 0
              tmp += dp_pre[j+1] if j < n-1
              tmp % 998244353
            else
              0
            end
  end
end

puts dp[0]
