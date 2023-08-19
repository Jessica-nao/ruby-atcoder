n = gets.to_i
s = gets.chomp.chars
q = gets.to_i
txc = []
last_t2_index = -1
last_t3_index = -1
q.times do |i|
  t, x, c = gets.split
  t = t.to_i
  if t == 2
    last_t2_index = i
  elsif t == 3
    last_t3_index = i
  end
  txc << [t, x.to_i - 1, c]
end

# pp txc
# pp "last_t2_index: #{last_t2_index}"
# pp "last_t3_index: #{last_t3_index}"

txc.each_with_index do |tmp, i|
  t, x, c = tmp
  if last_t2_index == i
    s = s.map(&:downcase)
  elsif last_t3_index == i
    s = s.map(&:upcase)
  end
  next if t > 1

  s[x] = c
end

puts s.join
