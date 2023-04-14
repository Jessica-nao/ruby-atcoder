gets
ans = -1
gets.split.map(&:to_i).sort.partition(&:odd?).each do |group|
  next if group.size < 2

  ans = [ans, group[-2..].sum].max
end
puts ans
