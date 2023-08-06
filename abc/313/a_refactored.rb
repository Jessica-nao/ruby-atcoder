n = gets.to_i
p1, *powers = gets.split.map(&:to_i)
if n == 1
  puts 0
  exit
end
other_max = powers.max
puts [0, other_max + 1 - p1].max
