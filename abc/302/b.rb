h, w = gets.split.map(&:to_i)
s = h.times.map {gets}

directions = -1.upto(1).flat_map do |i|
  -1.upto(1).map do |j|
    next if i == 0 && j == 0
    [i, j]
  end
end.compact

SNUKE = 'snuke'

h.times do |x|
  w.times do |y|
    next if s[x][y] != SNUKE[0]

    directions.each do |dx, dy|
      ans_arr = [[x, y]]
      1.upto(4).each do |dist|
        current_x = x + dx * dist
        current_y = y + dy * dist
        break if current_x < 0 || current_x >= h
        break if current_y < 0 || current_y >= w
        break if s[current_x][current_y] != SNUKE[dist]
        ans_arr << [current_x, current_y]
      end
      if ans_arr.size == 5
        puts ans_arr.map{_1.map(&:succ).join(' ')}
        return
      end
    end
  end
end
