def debug(obj)
  pp obj if false
end

n, _ = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

stack = []
ans = []
a_index = 0

1.upto(n) do |i|
  debug("i = #{i}, stack = #{stack}, ans = #{ans}")
  stack << i
  if i == a[a_index]
    a_index += 1
    next
  end

  ans << stack
  stack = []
end

puts ans.flat_map(&:reverse).join(' ')
