def debug(object, is_debug: false)
  pp object if is_debug
end

l, n1, n2 = gets.split.map(&:to_i)
a_maps = n1.times.map do
  gets.split.map(&:to_i)
end
b_maps = n2.times.map do
  gets.split.map(&:to_i)
end

debug(a_maps)
debug(b_maps)

ans = 0
a_map_index = 0
b_map_index = 0
a_l_pre = 0
b_l_pre = 0

while a_map_index < n1 && b_map_index < n2
  a_v, a_l = a_maps[a_map_index]
  a_l += a_l_pre
  b_v, b_l = b_maps[b_map_index]
  b_l += b_l_pre
  debug("a_l_pre = #{a_l_pre}, b_l_pre = #{b_l_pre}")
  debug("a_v = #{a_v}, a_l = #{a_l}, b_v = #{b_v}, b_l = #{b_l}")

  if a_v == b_v
    add = [a_l, b_l].min - [a_l_pre, b_l_pre].max
    debug("#{a_v}: #{add}")
    ans += add
  end

  if a_l < b_l
    a_l_pre = a_l
    a_map_index += 1
  else
    b_l_pre = b_l
    b_map_index += 1
  end
end

puts ans
