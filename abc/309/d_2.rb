n1, n2, m = gets.split.map(&:to_i)
n = n1 + n2
edges = Array.new(n) { [] }
m.times.each do
  a, b = gets.split.map{ _1.to_i - 1 }
  edges[a] << b
  edges[b] << a
end

INF = 150_001

distances = Array.new(n, INF)
distances[0] = distances[n-1] = 0

queue = [0, n-1]

while (u = queue.shift)
  edges[u].each do |v|
    next if distances[v] < INF

    distances[v] = distances[u] + 1
    queue.push(v)
  end
end

puts distances[..n1-1].max + distances[n1..].max + 1
