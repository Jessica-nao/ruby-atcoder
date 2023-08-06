map = <<~MAP
  ###.?????
  ###.?????
  ###.?????
  ....?????
  ?????????
  ?????....
  ?????.###
  ?????.###
  ?????.###
MAP
map = map.split("\n")

def same?(s, map)
  9.times do |x|
    9.times do |y|
      next if map[x][y] == '?'
      next if map[x][y] == s[x][y]

      return false
    end
  end
  true
end

n, m = gets.split.map(&:to_i)
s = n.times.map { gets.chomp }
(n-8).times do |i|
  (m-8).times do |j|
    cut_s = s[i..i+8].map { |row| row[j..j+8] }
    next unless same?(cut_s, map)

    puts "#{i+1} #{j+1}"
  end
end
