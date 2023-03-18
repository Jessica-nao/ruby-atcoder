require 'set'

is_debug = false

h, w = gets.split.map(&:to_i)
routes = h.times.each_with_object([]) { |_, arr| arr << gets.split.map(&:to_i) }

ans = 0
[0, 1].repeated_permutation(h+w-2) do |bits|
  next unless bits.count(&:zero?) == h-1
  pp bits if is_debug

  x, y = 0, 0
  found_nums = Set.new([routes[0][0]])
  is_good_path = true
  bits.each_with_index do |bit, i|
    x += 1 if bit == 0
    y += 1 if bit == 1
    current_num = routes[x][y]
    is_good_path &= found_nums.add?(current_num).nil?.!
  end

  pp is_good_path if is_debug
  puts "-----------------" if is_debug
  ans += 1 if is_good_path
end

puts ans
