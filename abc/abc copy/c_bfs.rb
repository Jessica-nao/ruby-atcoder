n, m = gets.split.map(&:to_i)
edges = Array.new(n) {[]}

m.times do
  a, b = gets.split.map{_1.to_i - 1}
  edges[a] << b
  edges[b] << a
end

reached_at = [false] * n
connected_components_count = 0
n.times do |i|
  next if reached_at[i]

  reached_at[i] = true
  connected_components_count += 1

  q = Queue.new
  q.push i
  while q.empty?.!
    v = q.pop
    edges[v].each do |u|
      next if reached_at[u]
      q.push u
      reached_at[u] = true
    end
  end
end

puts m - n + connected_components_count
