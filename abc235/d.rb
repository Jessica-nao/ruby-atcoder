LIMIT_NUMBER = 10 ** 6

def debug(obj)
  pp obj if true
end

def candidates(x)
  res = [x * @a]
  return res if x % 10 == 0 || x < 10

  res << x.to_s.chars.rotate(-1).join.to_i
end

@a, n = gets.split.map(&:to_i)
reached_at = [-1] * LIMIT_NUMBER
q = Queue.new
q.push(1)
reached_at[1] = 0
while !q.empty?
  x = q.pop
  # debug("x = #{x}, reached_at[x] = #{reached_at[x]}")
  candidates(x).each do |y|
    next if y > LIMIT_NUMBER || reached_at[y] != -1

    reached_at[y] = reached_at[x] + 1
    q.push(y)
  end
end

puts reached_at[n]
