a, b = gets.split.map(&:to_i)
is_yes = ((a - b).abs <= 1) && (a % 3 != 0)
puts is_yes ? 'Yes' : 'No'
