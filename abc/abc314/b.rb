n = gets.to_i
arr = n.times.map do |i|
  [i, gets.to_i, gets.split.map(&:to_i)]
end

x = gets.to_i

arr = arr.filter do |_, _, a|
  a.include?(x)
end

if arr.empty?
  puts 0
  exit
end

c_min = arr.min { |(_, c1, _), (_, c2, _)| c1 <=> c2 }[1]
arr = arr.filter do |_, c, _|
  c == c_min
end

puts arr.size
puts arr.map { |i, _, _| i + 1 }.join(' ')
