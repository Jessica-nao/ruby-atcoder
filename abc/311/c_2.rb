
class Graph
  def initialize(vertices)
    @vertices = vertices
    @graph = Array.new(vertices) { [] }
    @parent = Array.new(vertices)
  end

  def add_edge(u, v)
    @graph[u] << v
  end

  def is_cyclic_util(i, visited, rec_stack)
    visited[i] = true
    rec_stack[i] = true

    @graph[i].each do |neighbor|
      if !visited[neighbor]
        @parent[neighbor] = i
        if is_cyclic_util(neighbor, visited, rec_stack)
          return true
        end
      elsif rec_stack[neighbor]
        @parent[i] = neighbor
        return true
      end
    end

    rec_stack[i] = false
    false
  end

  def print_cycle(v)
    cycle = [v]
    u = @parent[v]
    while u != v
      cycle.push(u)
      u = @parent[u]
    end
    cycle.push(v)
    cycle.reverse!
    puts "Found cycle: #{cycle.join(' -> ')}"
  end

  def is_cyclic?
    visited = Array.new(@vertices, false)
    rec_stack = Array.new(@vertices, false)
    @vertices.times do |node|
      if !visited[node] && is_cyclic_util(node, visited, rec_stack)
        print_cycle(node)
        return true
      end
    end
    false
  end
end

n = gets.to_i
graph = Graph.new(n)
gets.split.map(&:to_i).each_with_index do |a, i|
  graph.add_edge(i, a - 1)
end

if graph.is_cyclic?
  puts "Graph contains cycle"
else
  puts "Graph doesn't contain cycle"
end
