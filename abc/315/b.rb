m = gets.to_i
days = gets.split.map(&:to_i)

total_days = (days.sum / 2) + 1
days.each_with_index do |d, i|
  if total_days > d
    total_days -= d
    next
  end

  puts "#{i+1} #{total_days}"
  break
end
