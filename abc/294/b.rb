h, _ = gets.split.map(&:to_i)
h.times do
  res = gets.split.map(&:to_i).map do |i|
    i.zero? ? '.' : ('A'.ord + i - 1).chr
  end.join
  puts res
end
