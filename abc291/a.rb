s = gets.chomp.chars
puts s.index { |i| i.ord < 'a'.ord } + 1
