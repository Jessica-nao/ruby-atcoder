def debug(obj)
  pp obj if false
end

n, k = gets.split.map(&:to_i)

a_list = gets.split.map(&:to_i)

z_list = a_list.map do |a|
  1.upto(k).map do |j|
    a * j
  end
end.flatten.uniq.sort[0..(k-1)]

debug(z_list)

1.upto(n-1) do |a_index|
  tmp_max = z_list[-1]
  0.upto(k-1) do |z_index|

    y_list = []
    0.upto(k).each do |j|
      z = z_list[z_index] + a_list[a_index] * j
      break if tmp_max < z

      y_list << z
    end

    z_list = (z_list + y_list).uniq.sort[0..(k-1)]
    debug z_list
  end
end

puts z_list[-1]
