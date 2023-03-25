require 'set'
n = gets.chomp
a = gets.split.map(&:to_i)
size_set = Set.new([])
ans = 0

a.each do |size|
  if size_set.include?(size)
    ans += 1
    size_set.delete(size)
  else
    size_set.add(size)
  end
end

puts ans
