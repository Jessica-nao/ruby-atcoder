def debug(obj)
  pp obj if true
end

a, b = gets.split.map(&:to_i)
ans = 0
while a != b
  a, b = b, a if a > b

  ans += b / a
  b %= a
  if b == 0
    ans -= 1
    break
  end
end

puts ans
