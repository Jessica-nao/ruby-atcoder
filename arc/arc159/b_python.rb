a, b = gets.split.map(&:to_i)
ans = 0

def next_g_calc(a, x)
  return a % x
end

def main(a, b)
  ans = 0
  while a > 0 && b > 0
    if a == 1 || b == 1 || a == b
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
    else
      diff = (a-b).abs

      if diff == 1
        ans += [a, b].min
        break
      end
      skip_steps = 1000000000000
      2.upto(diff) do |i|
        if diff % i == 0
          skip_steps = [skip_steps, next_g_calc(a, i)].min
          skip_steps = [skip_steps, next_g_calc(a, diff / i)].min
        end
        if i * i > diff
          skip_steps = [skip_steps, next_g_calc(a, diff)].min
          break
        end
      end
      ans += skip_steps
      a -= skip_steps
      b -= skip_steps
    end
  end
  return ans
end

puts main(a,b)
