def debug(object, is_debug: false)
  pp object if is_debug
end

r, c = gets.split.map(&:to_i)
b = r.times.map {gets.chomp}

0.upto(r-1) do |bomb_x|
  0.upto(c-1) do |bomb_y|
    next if ['.', '#'].include? b[bomb_x][bomb_y]

    dist = b[bomb_x][bomb_y].to_i
    b[bomb_x][bomb_y] = '.'
    debug "#bomb_x: #{bomb_x}, bomb_y: #{bomb_y}, dist: #{dist}"
    0.upto(r-1) do |target_x|
      0.upto(c-1) do |target_y|
        next if (bomb_x - target_x).abs + (bomb_y - target_y).abs > dist

        debug "#target_x: #{target_x}, target_y: #{target_y}"
        b[target_x][target_y] = '.' if b[target_x][target_y] == '#'
      end
    end
  end
end

puts b
