require 'set'

def distribute(arr)
  res = Array.new(26, 0)
  arr.each { |i| res[i] += 1 }
  res
end

h, w = gets.split.map(&:to_i)
@picture = h.times.map { gets.chomp.chars.map { _1.ord - 'a'.ord }}
@rows = @picture.map { |arr| distribute(arr) }
@lines = @picture.transpose.map { |arr| distribute(arr) }
@remain_row_color_count = @rows.map{ _1.count(&:positive?) }
@remain_line_color_count = @lines.map{ _1.count(&:positive?) }
@will_view_rows = h.times.to_set
@will_view_lines = w.times.to_set
remain_row_set = h.times.to_set
remain_line_set = w.times.to_set

def delete(i, j)
  char = @picture[i][j]

  @rows[i][char] -= 1
  if @rows[i][char].zero?
    @remain_row_color_count[i] -= 1
    @will_view_rows << i if @remain_row_color_count[i] == 1
  end

  @lines[j][char] -= 1
  if @lines[j][char].zero?
    @remain_line_color_count[j] -= 1
    @will_view_lines << j if @remain_line_color_count[j] == 1
  end
end

loop do
  delete_rows = Set.new
  delete_lines = Set.new

  @will_view_rows.each do |i|
    @will_view_rows.delete(i)
    next if @remain_row_color_count[i] != 1
    next if remain_line_set.size == 1

    delete_rows << i
  end

  @will_view_lines.each do |j|
    @will_view_lines.delete(j)
    next if @remain_line_color_count[j] != 1
    next if remain_row_set.size == 1

    delete_lines << j
  end

  delete_rows.each do |i|
    remain_line_set.each do |j|
      delete(i, j)
    end
    remain_row_set.delete(i)
  end
  delete_lines.each do |j|
    remain_row_set.each do |i|
      delete(i, j)
    end
    remain_line_set.delete(j)
  end

  break if delete_lines.empty? && delete_rows.empty?
end

pp @rows.sum(&:sum)
