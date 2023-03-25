n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

c = (a+b).sort.each.with_index(1).to_h

puts a.map{|x| c[x]}.join(' ')
puts b.map{|x| c[x]}.join(' ')
