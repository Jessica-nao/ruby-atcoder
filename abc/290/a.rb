gets
scores = gets.split.map(&:to_i)
correct_index = gets.split.map{ |i| i.to_i - 1 }

puts correct_index.sum{ |b| scores[b] }
