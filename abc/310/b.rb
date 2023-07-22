n, m = gets.split.map(&:to_i)
items = n.times.map do
  price, _, *function = gets.split.map(&:to_i)
  [price, function]
end.sort.reverse

is_yes = false

n.times do |i|
  n.times do |j|
    # j 番目の方が安いか、同じ値段であることを保証
    next if i >= j

    short_functions = items[i][1] - items[j][1]
    next unless short_functions.empty?

    extra_functions = items[j][1] - items[i][1]
    next if items[i][0] == items[j][0] && extra_functions.empty?

    is_yes = true
  end
end

puts is_yes ? 'Yes' : 'No'
