def debug obj
  pp obj if true
end

a, b = gets.split.map(&:to_i)
ans = 0
while a > 0 && b > 0
  if a == 1 || b == 1
    ans += 1
    break
  end

  g = a.gcd(b)
  if g > 1
    a /= g
    b /= g
    a -= 1
    b -= 1
    ans += 1
  elsif
    next_g = g.gcd((a-b).abs)
    x = [a % next_g, 1].max
    ans += x
    a -= x
    b -= x
  end
  debug("a = #{a}, b = #{b}, ans = #{ans}, g = #{g}")
end

puts ans
