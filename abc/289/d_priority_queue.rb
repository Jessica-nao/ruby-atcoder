n = gets
a = gets.split.map(&:to_i)
gets
b = gets.split.map(&:to_i)
x = gets.to_i

unavairable = [false] * (x+1)
b.each do |i|
  unavairable[i] = true
end

dp = [false] * (x+1)
dp[0] = true
1.upto(x) do |i|
  a.each do |ai|
    pre = i - ai
    next if pre < 0 || !dp[pre] || unavairable[i]

    dp[i] = true
  end
end

puts dp[x] ? 'Yes' : 'No'
