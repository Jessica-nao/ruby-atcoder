n = gets.to_i

sa = n.times.map { gets.split }

min_age = sa.min { |a, b| a[1].to_i <=> b[1].to_i }[1]
start_index = sa.index { |_, a| a == min_age }
n.times do |i|
  puts sa[(i+start_index) % n][0]
end
