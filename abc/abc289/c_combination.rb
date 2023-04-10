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

1.upto(m) do |use_set_num|
  a.combination(use_set_num) do |set|

end

puts ans

x = 0
1.upto(5) do |i|
  x |= i
end
x
full_bit = ('1' * 5).to_i(2)
