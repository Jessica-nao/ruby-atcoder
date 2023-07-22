n = gets.to_i
s = gets.chomp.chars

left_count = 0
ans = []

s.each do |c|
  if c != ')' || left_count == 0
    ans << c
    left_count += 1 if c == '('
    next
  end

  left_count -= 1
  loop do
    break if ans.pop == '('
  end
end

puts ans.join
