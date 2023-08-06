n = gets.to_i
p1, *powers = gets.split.map(&:to_i)
if n == 1
  puts 0
  exit
end
other_max = powers.max
if p1 > other_max
  puts 0
elsif p1 == other_max
  puts 1
else
  puts other_max - p1 + 1
end
