require 'set'

n, m = gets.split.map(&:to_i)
left = Set.new(1.upto(n).to_a)
m.times do
  _, b = gets.split.map(&:to_i)
  left.delete(b)
end

if left.size == 1
  puts left.to_a.first
else
  puts 0-1
end
