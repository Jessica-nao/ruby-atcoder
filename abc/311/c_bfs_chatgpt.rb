def find_cycle(n, edges)
  graph = Array.new(n) { [] }
  edges.each do |u, v|
    graph[u] << v
  end

  n.times do |i|
    visited = Array.new(n, false)
    parent = Array.new(n, -1)
    queue = [i]

    while !queue.empty?
      node = queue.shift
      visited[node] = true

      graph[node].each do |neighbor|
        if !visited[neighbor]
          queue.push(neighbor)
          parent[neighbor] = node
        elsif parent[node] != neighbor
          # cycle found, print it
          cycle = [neighbor, node]
          while node != neighbor
            node = parent[node]
            cycle.unshift(node)
          end
          return "Cycle: #{cycle.join(' -> ')}"
        end
      end
    end
  end

  "No cycle found"
end

n = gets.to_i
edges = Array.new(n) { [] }

gets.split.map(&:to_i).each_with_index do |a, i|
  edges[i] << (a - 1)
end
puts find_cycle(n, edges)
