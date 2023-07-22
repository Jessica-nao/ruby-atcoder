h, w, n = gets.split.map(&:to_i)

holes = Array.new(h) { Array.new(w, false) }

n.times.map do
  x, y = gets.split.map(&:to_i)
  holes[x - 1][y - 1] = true
end

dp_pre = Array.new(w, 0)
dp = Array.new(w, 0)

ans = 0

h.times do |i|
  w.times do |j|
    if holes[i][j]
      dp[j] = 0
    else
      left = j > 0 ? dp[j - 1] : 0
      up = i > 0 ? dp_pre[j] : 0
      diagonal = i > 0 && j > 0 ? dp_pre[j - 1] : 0
      dp[j] = [left, up, diagonal].min + 1
    end
  end
  ans += dp.sum
  dp_pre = dp
  dp = Array.new(w, 0)
end

puts ans
