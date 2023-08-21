require 'set'

h, w = gets.split.map(&:to_i)

@picture = h.times.map { gets.chomp.chars.map { _1.ord - 'a'.ord }}
@remain_row_set = h.times.to_set
@remain_line_set = w.times.to_set

def distribute(arr)
  res = Array.new(26, 0)
  arr.each { |i| res[i] += 1 }
  res
end

@rows = @picture.map { |arr| distribute(arr) }
@lines = @picture.transpose.map { |arr| distribute(arr) }
@remain_row_color_count = @rows.map{ _1.count(&:positive?) }
@remain_line_color_count = @lines.map{ _1.count(&:positive?) }

def delete(i, j)
  char = @picture[i][j]

  @rows[i][char] -= 1
  @remain_row_color_count[i] -= 1 if @rows[i][char].zero?
  @lines[j][char] -= 1
  @remain_line_color_count[j] -= 1 if @lines[j][char].zero?
end

loop do
  delete_rows = Set.new
  delete_lines = Set.new

  @remain_row_set.each do |i|
    next if @remain_row_color_count[i] != 1
    next if @rows[i].find(&:positive?) == 1

    delete_rows << i
  end

  @remain_line_set.each do |j|
    next if @remain_line_color_count[j] != 1
    next if @lines[j].find(&:positive?) == 1

    delete_lines << j
  end

  delete_rows.each do |i|
    @remain_line_set.each do |j|
      delete(i, j)
    end
    @remain_row_set.delete(i)
  end
  delete_lines.each do |j|
    @remain_row_set.each do |i|
      delete(i, j)
    end
    @remain_line_set.delete(j)
  end

  break if delete_lines.empty? && delete_rows.empty?
end

pp @rows.sum(&:sum)
