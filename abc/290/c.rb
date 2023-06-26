_, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).uniq.sort
a.each.with_index do |int, index|
  next if int == index && int < k

  puts [index, 0].max
  return 0
end

puts a.size
