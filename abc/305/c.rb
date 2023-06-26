h, w = gets.split.map(&:to_i)
s = h.times.map {gets.chomp}

min_h = min_w = 1000
max_h = max_w = 0

h.times do |i|
  w.times do |j|
    next if s[i][j] != '#'

    min_h = [min_h, i].min
    max_h = [max_h, i].max
    min_w = [min_w, j].min
    max_w = [max_w, j].max
  end
end

h.times do |i|
  next if i < min_h || max_h < i

  w.times do |j|
    next if j < min_w || max_w < j
    next if s[i][j] == '#'

    puts "#{i+1} #{j+1}"
  end
end
