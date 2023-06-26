def hamming_distance(s, t)
  s.size.times.count do |i|
    s[i] != t[i]
  end
end


def main
  n, m = gets.split.map(&:to_i)
  s = n.times.map {gets}
  puts s
end

main
