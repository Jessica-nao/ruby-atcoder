def debug(obj)
  pp obj if false
end

n, d = gets.split.map(&:to_i)
points = n.times.map {gets.split.map(&:to_i)}

@d_square = d * d

def near?(point1, point2)
  x1, y1 = point1
  x2, y2 = point2
  (x1 - x2).pow(2) + (y1 - y2).pow(2) <= @d_square
end

edges = Array.new(n) {[]}
n.times do |i|
  point1 = points[i]
  n.times.each do |j|
    next if i >= j

    point2 = points[j]
    if near?(point1, point2)
      edges[i] << j
      edges[j] << i
    end
  end
end

seen = [false] * n
infected = [false] * n
q = Queue.new
q.push 0

until q.empty?
  u = q.pop
  next if seen[u]

  infected[u] = true

  edges[u].each do |v|
    q.push v
  end

  seen[u] = true
end

debug edges

infected.each do |bool|
  puts bool ? 'Yes' : 'No'
end
