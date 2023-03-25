a, x, m = gets.split.map(&:to_i)

if a == 1
  puts x % m
else
  puts (a.pow(x, m*(a-1)) - 1) / (a-1) % m
end
