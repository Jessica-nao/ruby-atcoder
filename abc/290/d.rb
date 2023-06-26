puts gets.to_i.times.map do
  n, d, k = gets.split.map(&:to_i)
  k -= 1
  c = n / n.gcd(d)
  n_th_group = k % c
  n_th_in_group = k / c
  n_th_group * d % n + n_th_in_group
end
