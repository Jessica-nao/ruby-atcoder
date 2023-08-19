n = gets.to_i
a = gets.split.map(&:to_i)

def mex(arr)
  ans = 0
  while ans <= 3
    return ans unless arr.include?(ans)

    ans += 1
  end
end

s = %i[M E X].to_h { |c| [c, []] }
gets.chomp.chars.each_with_index { |c, i| s[c.to_sym] << i }


