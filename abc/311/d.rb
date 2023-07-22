def debug(obj)
  pp obj if true
end

n, m = gets.split.map(&:to_i)
visited = Array.new(n) { Array.new(m, false) }
touched = Array.new(n) { Array.new(m, false) }

maze = n.times.map { gets.chomp.chars }

queue = [[1, 1]]
directions = [
  [1, 0],
  [0, 1],
  [-1, 0],
  [0, -1]
]

until queue.empty?
  x, y = queue.shift
  next if x < 0 || y < 0 || x >= n || y >= m
  next if visited[x][y]
  next if maze[x][y] == '#'

  visited[x][y] = true
  touched[x][y] = true

  directions.each do |dx, dy|
    1.upto(201).each do |length|
      nx = x + (dx * length)
      ny = y + (dy * length)
      break if nx < 0 || ny < 0 || nx >= n || ny >= m
      break if visited[nx][ny]

      if maze[nx][ny] == '#'
        queue << [x + (dx * (length - 1)), y + (dy * (length - 1))]
        break
      end
      touched[nx][ny] = true
    end
  end
end

ans = 0
touched.each do |row|
  ans += row.count(true)
end
puts ans
