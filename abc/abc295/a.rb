n = gets.to_i
w = gets.split
is_yes = w.filter do |x|
  ['and', 'not', 'that', 'the', 'you'].include?(x)
end.size >= 1
puts is_yes ? "Yes" : "No"
