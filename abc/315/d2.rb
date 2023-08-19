require 'set'

h, w = gets.split.map(&:to_i)

picture = h.times.map { gets.chomp.chars.map { _1.ord - 'a'.ord }}
transposed_picture = picture.transpose
left_rows = h.times.to_set
left_lines = w.times.to_set


loop do
  delete_rows = Set.new
  unchanged = true

  left_rows.each do |i|
    next if picture[i].reject{ _1 == false }.size <= 1
    next if picture[i].reject{ _1 == false }.to_set.size > 1

    unchanged = false
    left_rows.delete(i)
    delete_rows.add(i)
  end

  left_lines.each do |j|
    next if transposed_picture[j].reject{ _1 == false }.size <= 1
    next if transposed_picture[j].reject{ _1 == false }.to_set.size > 1

    unchanged = false
    h.times do |i|
      transposed_picture[j][i] = false
      picture[i][j] = false
    end
    left_lines.delete(j)
  end

  delete_rows.each do |i|
    w.times do |j|
      picture[i][j] = false
      transposed_picture[j][i] = false
    end
  end
  break if unchanged
end

puts picture.sum { _1.count { |x| x != false } }
