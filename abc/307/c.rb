require 'set'

ha, wa = gets.split.map(&:to_i)
a_design = ha.times.map {gets.chomp.chars}
hb, wb = gets.split.map(&:to_i)
b_design = hb.times.map {gets.chomp.chars}
hx, wx = gets.split.map(&:to_i)
x_design = hx.times.map {gets.chomp.chars}

def black_positions(design)
  ans = []
  design.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      ans << [i, j] if cell == '#'
    end
  end
  ans
end

a_black_positions = black_positions(a_design)
b_black_positions = black_positions(b_design)
x_black_positions = black_positions(x_design)
x_black_position_set = Set.new(x_black_positions)

range = -11.upto(11)
wrong = false

range.each do |a_diff_i|
  range.each do |a_diff_j|
    wrong = false
    a_moved_black_positions = []
    a_black_positions.each do |a_i, a_j|
      moved_a_position = [a_i + a_diff_i, a_j + a_diff_j]
      wrong |= !x_black_position_set.include?(moved_a_position)
      a_moved_black_positions << moved_a_position
    end
    next if wrong

    range.each do |b_diff_i|
      range.each do |b_diff_j|
        wrong = false
        c_black_positions = a_moved_black_positions.dup
        b_black_positions.each do |b_i, b_j|
          moved_b_position = [b_i + b_diff_i, b_j + b_diff_j]
          c_black_positions << moved_b_position
          wrong |= !x_black_position_set.include?(moved_b_position)
          break if wrong
        end
        next if wrong
        next if c_black_positions.uniq.size != x_black_positions.size

        puts 'Yes'
        exit
      end
    end
  end
end

puts 'No'
