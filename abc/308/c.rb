n = gets.to_i
INF = 1_100_100_100
tmp = n.times
       .map do |i|
         a, b = gets.split.map(&:to_i)
         possibility = b.zero? ? INF : Rational(a, b)
         [possibility, -(i + 1)]
       end
tmp = tmp.sort
         .reverse
         .map { |_, i| -i }

puts tmp.join(' ')
