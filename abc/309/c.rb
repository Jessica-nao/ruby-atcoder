n, k = gets.split.map(&:to_i)
abs = n.times.map { gets.split.map(&:to_i) }.sort_by { |a, _| a }

current_medicine = abs.map { |_, b| b }.sum

x = 0
abs.each do |a, b|
  break if current_medicine <= k

  current_medicine -= b
  x = a
end

puts x + 1
