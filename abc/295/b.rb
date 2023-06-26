def debug(object, is_debug: false)
  pp object if is_debug
end

r, c = gets.split.map(&:to_i)
b = r.times.map {gets.chomp}
dx = [1, 1, -1, -1]
dy = [1, -1, 1, -1]

0.upto(r-1) do |from_x|
  0.upto(c-1) do |from_y|
    debug("from_x = #{from_x}, from_y = #{from_y}")
    next if ['.', '#'].include? b[from_x][from_y]

    dist = b[from_x][from_y].to_i
    b[from_x][from_y] = '.'
    0.upto(dist) do |i|
      0.upto(dist - i) do |j|
        4.times do |direction_index|
          next_x = from_x + i * dx[direction_index]
          next_y = from_y + j * dy[direction_index]
          next unless 0 <= next_x && next_x < r
          next unless 0 <= next_y && next_y < c
          if b[next_x][next_y] == '#'
            b[next_x][next_y] = '.'
          end
        end
      end
    end
  end
end

puts b
