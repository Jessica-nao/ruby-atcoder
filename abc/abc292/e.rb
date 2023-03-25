def debug(object, is_debug = false)
  pp object if is_debug
end

n, m = gets.split.map(&:to_i)
edges = Array.new(n) { Array.new(0) }
m.times do
  u, v = gets.split.map{ |i| i.to_i - 1 }
  edges[u] << v
end

debug(edges)

ans = -m
0.upto(n-1) do |i|
  has_seen = Array.new(n, false)
  has_seen[i] = true
  waiting_que = Queue.new
  waiting_que << i
  while waiting_que.empty?.! do
    x = waiting_que.pop
    edges[x].each do |y|
      next if has_seen[y]

      has_seen[y] = true
      waiting_que << y
      ans += 1
    end
  end
end

puts ans
