require 'set'

h, w = gets.split.map(&:to_i)

picture = h.times.map { gets.chomp.chars.map { _1.ord - 'a'.ord }}
transposed_picture = picture.transpose
deleted = Array.new(h) { Array.new(w, false) }

rows = picture.map(&:tally)
lines = transposed_picture.map(&:tally)

loop do
  delete_rows = Set.new
  delete_lines = Set.new
  unchanged = true

  rows.each_with_index do |hash, i|
    next if hash.keys.size != 1
    next if hash.values.first == 1

    delete_rows << i
    rows[i] = {}
    unchanged = false
  end

  lines.each_with_index do |hash, j|
    next if hash.keys.size != 1
    next if hash.values.first == 1

    delete_lines << j
    lines[j] = {}
    unchanged = false
  end

  delete_rows.each do |i|
    w.times do |j|
      next if deleted[i][j]

      deleted[i][j] = true
      target = picture[i][j]
      next unless lines[j].key?(target)

      lines[j][target] -= 1
      lines[j].delete(target) if lines[j][target] == 0
    end
  end
  delete_lines.each do |j|
    h.times do |i|
      next if deleted[i][j]

      deleted[i][j] = true
      target = picture[i][j]
      next unless rows[i].key?(target)

      rows[i][target] -= 1
      rows[i].delete(target) if rows[i][target] == 0
    end
  end

  break if unchanged
end

pp rows.sum { _1.values.sum }
