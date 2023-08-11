n1, n2, m = gets.split.map(&:to_i)
n = n1 + n2
edges = m.times.map { gets.split.map(&:to_i) }
         .each_with_object(Array.new(n+1) { [] }) do |(a, b), arr|
           arr[a] << b
           arr[b] << a
         end

distances = Array.new(n + 1, -1)
distances[1] = distances[n] = 0

queue = [1, n]

while (u = queue.shift)
  edges[u].each do |v|
    next if distances[v] != -1

    distances[v] = distances[u] + 1
    queue.push(v)
  end
end

puts distances[..n1].max + distances[n1 + 1..].max + 1
