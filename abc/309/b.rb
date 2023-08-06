n = gets.to_i
a = n.times.map { gets.chomp }
b = Array.new(n) { Array.new(n) }

def rotate_boarder_elements(a, i, j, n)
  return a[i][j-1] if i == 0 && j > 0
  return a[i-1][j] if j == n - 1 && i > 0
  return a[i][j+1] if i == n - 1 && j < n - 1
  return a[i+1][j] if j == 0 && i < n - 1

  a[i][j]
end

n.times do |i|
  n.times.map do |j|
    b[i][j] = rotate_boarder_elements(a, i, j, n)
  end

  puts b[i].join
end
