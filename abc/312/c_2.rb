_, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i) + gets.split.map { |x| x.to_i + 1 }
puts a.sort[m-1]
