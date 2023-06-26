s = gets.chomp
1.upto(s.size) do |i|
  print  i.odd? ? s[i] : s[i-2]
end
