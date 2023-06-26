def debug(obj)
  pp obj if true
end

w, h = gets.split.map(&:to_i)
n = gets.to_i
pq = n.times.map {gets.split.map(&:to_i)}
A = gets.to_i
a = gets.split.map(&:to_i)
B = gets.to_i
b = gets.split.map(&:to_i)

cakes_count = {}

pq.each do |x, y|
  i = a.bsearch_index{ |t| x < t}
  j = b.bsearch_index{ |t| y < t}
  cakes_count[[i, j]] ||= 0
  cakes_count[[i, j]] += 1
end

m = if cakes_count.keys.size < (A+1) * (B+1)
      0
    else
      cakes_count.values.min
    end
M = cakes_count.values.max

puts "#{m} #{M}"
