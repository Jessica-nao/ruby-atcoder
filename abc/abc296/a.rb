n = gets.to_i
s = gets.chomp
(n-1).times do |i|
  next if s[i] != s[i+1]

  puts "No"
  return
end

puts "Yes"
