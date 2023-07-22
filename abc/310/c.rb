require 'set'

n = gets.to_i
ss = Set.new
n.times do
  s = gets.chomp
  if s > s.reverse
    ss.add(s.reverse)
  else
    ss.add(s)
  end
end

puts ss.size
