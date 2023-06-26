n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

a_cnt = [0] * n
b_cnt = [0] * m
a_index = b_index = 0

1.upto(n+m) do |i|
  if b_index > m-1 || (a_index < n && a[a_index] < b[b_index])
    a_cnt[a_index] = i
    a_index += 1
  else
    b_cnt[b_index] = i
    b_index += 1
  end
end

puts a_cnt.join(' ')
puts b_cnt.join(' ')
