gets
evens = []
odds = []
gets.split.each do |i|
  i = i.to_i
  (i.even? ? evens : odds) << i
end

evens.sort!
odds.sort!

ans = -1

if evens.size > 1
  ans = [ans, evens[-2..].sum].max
end

if odds.size > 1
  ans = [ans, odds[-2..].sum].max
end

puts ans
