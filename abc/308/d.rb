SNUKE = 'snuke'.freeze

h, w = gets.split.map(&:to_i)
s = h.times.map { gets.chomp }

queue = [[0, 0, 0]]

visited = Array.new(h) { Array.new(w, false) }
directions = [
  [-1, 0],
  [0, 1],
  [1, 0],
  [0, -1]
]

while (position = queue.shift)
  y, x, count = position
  next if visited[y][x]
  next unless s[y][x] == SNUKE[count]

  count = (count + 1) % SNUKE.size

  directions.each do |dy, dx|
    ny = y + dy
    nx = x + dx
    next if ny < 0 || ny >= h || nx < 0 || nx >= w
    next if visited[ny][nx]

    queue << [ny, nx, count]
  end

  visited[y][x] = true
end

puts visited[h - 1][w - 1] ? 'Yes' : 'No'
