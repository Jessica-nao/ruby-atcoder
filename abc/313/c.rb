n = gets.to_i
a = gets.split.map(&:to_i).sort.reverse
a_sum = a.sum

m = a_sum / n
large_count = a_sum % n

ans = 0

n.times do |i|
  if i < large_count
    ans += (a[i] - (m + 1)).abs
    next
  end

  ans += (a[i] - m).abs
end

puts ans / 2
