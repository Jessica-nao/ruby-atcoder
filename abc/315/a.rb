s = gets.chomp.chars
ans = ''
s.each do |c|
  next if 'aeiou'.include?(c)

  ans << c
end

puts ans
