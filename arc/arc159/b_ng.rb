def debug obj
  pp obj if false
end

a, b = gets.split.map(&:to_i)
ans = 0

def main(a, b)
  ans = 0
  while a > 0 && b > 0
    if a == 1 || b == 1 || a == b
      ans += 1
      break
    end

    g = a.gcd(b)
    debug("a = #{a}, b = #{b}, g = #{g}")
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
      debug("diff = #{diff}")
      2.upto(diff) do |i|
        if diff % i == 0
          skip_steps = [skip_steps, a % i].min
          skip_steps = [skip_steps, a % (diff / i)].min
        end
        if i * i > diff
          skip_steps = [skip_steps, a % diff].min
          break
        end
      end
      debug("skip_steps = #{skip_steps}")
      skip_steps = [skip_steps, 1].max
      ans += skip_steps
      a -= skip_steps
      b -= skip_steps
    end
    debug("a = #{a}, b = #{b}, ans = #{ans}, g = #{g}")
    debug("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
  end
  return ans
end

def main2(a, b)
  ans = 0
  while a > 0 && b > 0
    if (a-b).abs == 1
      ans += [a, b].min
      break
    end
    g = a.gcd(b)
    a /= g
    b /= g
    a -= 1
    b -= 1
    ans += 1
    debug("a = #{a}, b = #{b}, ans = #{ans}, g = #{g}")
  end
  return ans
end

def test1
  100.times do
    # a = 29443
    # b = 9098
    a = rand(99999)
    b = rand(99999)
    ans1 = main(a, b)
    ans2 = main2(a, b)
    if ans1 != ans2
      pp ("a = #{a}, b = #{b}, main = #{ans1}, main2 = #{ans2}")
    else
      pp 'ok'
    end
  end
end

# test1

# "a = 6169, b = 60101, main = 103, main2 = 25"
# a = 6169
# b = 60101
# main(a, b)
# debug("---------------")
# main2(a, b)


puts main(a, b)
