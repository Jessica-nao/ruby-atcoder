a, b = gets.split.map(&:to_f)

candidats = [
  2.0 / Math.sqrt(3) * a,
  2.0 / Math.sqrt(3) * b,
  Math.sqrt(4.0 * (a * a + b * b - Math.sqrt(3) * a * b))
]

puts candidats.min
