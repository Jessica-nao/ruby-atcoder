n, m = gets.split.map(&:to_i)
cs = gets.split
ds = gets.split

p0, *ps = gets.split.map(&:to_i)

prices = {}
prices.default = p0
m.times do |i|
  prices[ds[i]] = ps[i]
end

ans = 0
cs.each do |c|
  ans += prices[c]
end

puts ans
