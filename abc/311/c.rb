n = gets.to_i
edges = Array.new(n)
gets.split.map(&:to_i).each_with_index do |a, i|
  edges[i] = a - 1
end

visited = Array.new(n, false)
parents = Array.new(n, -2)

n.times do |i|
  next if visited[i]

  visited[i] = true
  visited_this_round = Array.new(n, false)

  queue = [i]
  until queue.empty?
    u = queue.pop
    if visited_this_round[u]
      circles = [u]
      loop do
        circles.push(parents[circles.last])
        next if circles.last != u

        circles.pop
        circles.reverse!
        puts circles.size
        puts circles.map { |x| x + 1 }.join(' ')
        exit
      end
    end

    visited[u] = true
    visited_this_round[u] = true
    parents[edges[u]] = u
    queue.push(edges[u])
    # pp "queue: #{queue}"
    # pp "visited_this_round: #{visited_this_round}"
  end
end
