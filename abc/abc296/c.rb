def debug(obj)
  pp obj if true
end

n, x = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort
b = a.map{ |i| -1 * i }.reverse
# a + b == x
a.each do |i|
  search_result = b.bsearch { |j| x - j - i }
  if search_result
    puts "Yes"
    return
  end
end

puts "No"
