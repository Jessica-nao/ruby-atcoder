s = gets.chomp.chars

is_yes = true
b_indexes = s.each_with_object([]).with_index(0) do |x, idx|
  c, arr = x
  arr << idx if c == ?B
end

is_yes &= b_indexes.sum.odd?

r_indexes = s.each_with_object([]).with_index(0) do |x, idx|
  c, arr = x
  arr << idx if c == ?R
end

k_index = s.index(?K)
is_yes &= (r_indexes[0] < k_index) && (k_index < r_indexes[1])

puts is_yes ? "Yes" : 'No'
