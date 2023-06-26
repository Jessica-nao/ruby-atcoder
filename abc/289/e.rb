def solve
  n, m = gets.split.map(&:to_i)
  colors = gets.split.map(&:to_i)
  edges = Array.new(n) {[]}
  m.times do
    u, v = gets.split.map{ _1.to_i - 1 }
    edges[u] << v
    edges[v] << u
  end
  distances = Array.new(n) {[-1] * n}
  distances[n-1][0] = 0
  q = Queue.new
  q << [n-1, 0]
  while !q.empty?
    takahashi, aoki = q.pop
    dist = distances[takahashi][aoki]
    edges[takahashi].each do |f_takahashi|
      edges[aoki].each do |f_aoki|
        next if distances[f_takahashi][f_aoki] != -1
        next if colors[f_takahashi] == colors[f_aoki]

        distances[f_takahashi][f_aoki] = dist + 1
        q << [f_takahashi, f_aoki]
      end
    end
  end
  puts distances[0][n-1]
end

gets.to_i.times { solve }
