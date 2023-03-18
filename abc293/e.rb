def solve(a, x, m)
  return 0 if x.zero?

  return (solve(a, x/2, m) * (1 + a.pow(x/2, m))) % m if x.even?

  (1 + a * solve(a, x-1, m)) % m
end

a, x, m = gets.split.map(&:to_i)
puts solve(a, x, m)
