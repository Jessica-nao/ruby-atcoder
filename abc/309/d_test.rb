require 'benchmark'
@n = 10000
arr = @n.times.to_a
@edges = Array.new(@n) do
  arr.sample(rand(@n))
end

def solve(use_empty: false)
  distances = Array.new(@n, -1)
  distances[0] = 0

  queue = [0]

  if use_empty
    until queue.empty?
      u = queue.shift

      @edges[u]&.each do |v|
        next if distances[v] != -1

        distances[v] = distances[u] + 1
        queue.push(v)
      end
    end
  else
    while (u = queue.shift)
      @edges[u]&.each do |v|
        next if distances[v] != -1

        distances[v] = distances[u] + 1
        queue.push(v)
      end
    end
  end

  distances
end

Benchmark.bm do |x|
  x.report('use empty') { solve(use_empty: true) }
  x.report('not use empty') { solve(use_empty: false) }
end
