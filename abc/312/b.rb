@n, @m = gets.split.map(&:to_i)
@codes = @n.times.map { gets.chomp }

def solve(i, j)
  9.times.map do |x|
    9.times.map do |y|
      px = i + x
      py = j + y
      return false if px < 0 || px >= @n || py < 0 || py >= @m

      return false unless check(x, y, @codes[px][py])
    end
  end
  true
end

def check(x, y, char)
  if (x < 3 && y < 3) || (x >= 6 && y >= 6)
    return char == '#'
  elsif (x == 3 && y < 3) || (y == 3 && x < 3) || (x == 6 && y >= 6) || (y == 6 && x >= 6)
    return char == '.'
  end

  true
end

@n.times do |i|
  @m.times do |j|
    puts [i+1, j+1].join(' ') if solve(i, j)
  end
end
