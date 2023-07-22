n, d = gets.split.map(&:to_i)

can_choose = Array.new(d) { true }
n.times do
  gets.chomp.chars.each_with_index do |c, i|
    next if c == 'o'

    can_choose[i] = false
  end
end

ans = 0
tmp = 0
d.times do |i|
  unless can_choose[i]
    tmp = 0
    next
  end

  tmp += 1
  ans = [ans, tmp].max
end

puts ans
