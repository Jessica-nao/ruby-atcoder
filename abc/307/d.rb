def debug(obj)
  pp obj if true
end

n = gets.to_i
s = gets.chomp.chars

# n = 4
# s = ')()('

# n = 4
# s = '(())'

depth = [0] * n

(n+1).times do |i|
  pre = i == 0 ? 0 : depth[i-1]
  case s[i]
  when '('
    depth[i] = pre + 1
  when ')'
    depth[i] = pre
    depth[i+1]
  end
  depth[i] = d
end

debug depth

from_left = [false] * n
from_right = [false] * n



puts arr.reverse.join
