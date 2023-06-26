row = (1..8).to_a.reverse
column = (?a..?h).to_a
s = 8.times.map { gets.chomp }

8.times do |i|
  8.times do |j|
    next if s[i][j] == ?.

    puts "#{column[j]}#{row[i]}"
    return
  end
end
