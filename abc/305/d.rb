n = gets.to_i
@a = gets.split.map(&:to_i)
q = gets.to_i

@b = [0] * n

n.times.each do |i|
  pre_sum = i == 0 ? 0 : @b[i-1]
  pre_a = i == 0 ? 0 : @a[i-1]

  # 奇数番目から、偶数番目までの時間で寝ている
  @b[i] = pre_sum + (i.odd? ? 0 : @a[i] - pre_a)
end

def total_slept_time_at(time)
  return 0 if time == 0

  index = @a.bsearch_index { |x| x >= time }
  return @b[index] if index.odd?

  @b[index] - (@a[index] - time)
end

def solve(left, right)
  right_time = total_slept_time_at(right)
  left_time = total_slept_time_at(left)
  # pp "#{left}: #{left_time}"
  # pp "#{right}: #{right_time}"
  puts right_time - left_time
end

q.times do
  l, r = gets.split.map(&:to_i)
  solve(l, r)
end
