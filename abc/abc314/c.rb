n, m = gets.split.map(&:to_i)
s = gets.chomp.chars
c_arr = gets.split.map{ _1.to_i - 1 }

tmp = Array.new(m) { [] }
c_arr.each_with_index do |c, i|
  tmp[c] << s[i]
end
tmp = tmp.map { _1.rotate(-1) }
ans = ''

n.times.each do |i|
  ans << tmp[c_arr[i]].shift
end

puts ans
