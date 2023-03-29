n = gets.to_i
x = gets.split.map(&:to_i).sort
puts x[n, 3 * n].sum / (n * 3.0)
