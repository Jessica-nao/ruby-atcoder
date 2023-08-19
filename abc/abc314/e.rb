n, m = gets.split.map(&:to_i)

arr = n.times.map do
  c, q, *s = gets.split.map(&:to_i)
  [c, s.sum.to_f / q]
end
