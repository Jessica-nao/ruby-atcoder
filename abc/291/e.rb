n, m = gets.split.map(&:to_i)
degrees = [0] * n
edges = Array.new(n) {[]}
m.times.map do
  a, b = gets.split.map{ |i| i.to_i - 1 }
  next if edges[b].include?(a)

  edges[b] << a
  degrees[a] += 1
end

q = Queue.new
degrees.each.with_index do |deg, index|
  next if deg > 0

  q.push(index)
end

ans = [0] * n
fill_number = n

while q.size > 0
  if q.size != 1
    puts 'No'
    return 0
  end

  v = q.pop
  ans[v] = fill_number
  fill_number -= 1

  edges[v].each do |u|
    degrees[u] -= 1
    q << u if degrees[u] == 0
  end
end

puts 'Yes'
puts ans * ' '
