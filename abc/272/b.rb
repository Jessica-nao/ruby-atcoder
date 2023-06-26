require 'set'
n, m = gets.split.map(&:to_i)
has_attended_with = Array.new(n) {Set.new}
m.times do
  _, *arr = gets.split.map{ _1.to_i - 1 }
  arr.each do |i|
    arr.each do |j|
      has_attended_with[i].add(j)
      has_attended_with[j].add(i)
    end
  end
end

puts has_attended_with.all? {_1.size == n} ? 'Yes' : 'No'
