h, w, n = gets.split.map(&:to_i)

holes = Array.new(h) { Array.new(w, false) }

n.times.map do
  x, y = gets.split.map(&:to_i)
  holes[x - 1][y - 1] = true
end

dp = Array.new(h) { Array.new(w, 0) }
ans = 0

h.times do |i|
  w.times do |j|
    if holes[i][j]
      dp[i][j] = 0
    else
      left = j > 0 ? dp[i][j - 1] : 0
      up = i > 0 ? dp[i - 1][j] : 0
      diagonal = i > 0 && j > 0 ? dp[i - 1][j - 1] : 0
      dp[i][j] = [left, up, diagonal].min + 1
    end
    ans += dp[i][j]
  end
end

puts ans
