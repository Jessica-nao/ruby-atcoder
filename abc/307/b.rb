n = gets.to_i
ss = n.times.map { gets.chomp }

n.times do |i|
  n.times do |j|
    next if i == j
    tmp = ss[i] + ss[j]
    if tmp == tmp.reverse
      puts 'Yes'
      exit
    end
  end
end
puts 'No'
