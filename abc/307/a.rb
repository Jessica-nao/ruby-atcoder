n = gets.to_i
sums = gets.split.map(&:to_i).each_slice(7).map {|a| a.sum}.join(' ')
puts sums
