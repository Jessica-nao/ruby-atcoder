require 'set'

def debug obj
  pp obj if false
end

n, m = gets.split.map(&:to_i)
a = m.times.map do
  gets
  gets.split.map(&:to_i)
end

debug a

ans = 0

[0, 1].repeated_permutation(m) do |bits|
  s = Set.new
  bits.each_with_index do |bit, i|
    next if bit == 0

    s += a[i]
  end
  debug s
  ans += 1 if s.size == n
end

puts ans
