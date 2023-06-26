def solve(s)
  w = s.size
  i = 0
  while i < w-1 do
    if s[i] == ?T && s[i+1] == ?T
      s[i] = ?P
      s[i+1] = ?C
      i += 1
    end
    i += 1
  end
  return s
end

h, w = gets.split.map(&:to_i)
ans = []

h.times do
  puts solve(gets.chomp)
end
