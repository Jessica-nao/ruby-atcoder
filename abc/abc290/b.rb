n, left_slot = gets.split.map(&:to_i)
s = gets.chomp
n.times do |i|
  next if s[i] == 'x'

  if left_slot == 0
    s[i] = 'x'
  else
    left_slot -= 1
  end
end
puts s
