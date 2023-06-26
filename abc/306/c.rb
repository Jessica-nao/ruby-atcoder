n = gets.to_i
a = gets.split.map(&:to_i)
first_found = 1.upto(n).to_h {[_1, -1]}
second_found = first_found.dup
a.each.with_index(1) do |i, index|
  if first_found[i] == -1
    first_found[i] = index
  elsif second_found[i] == -1
    second_found[i] = index
  end
end

puts second_found.sort_by {|_, v| v }.map{|k, _| k}.join(' ')
