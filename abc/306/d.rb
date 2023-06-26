def debug(obj)
  pp obj if false
end

n = gets.to_i
xys = n.times.map {gets.split.map(&:to_i)}

status_and_points = n.times.map {[0,0]}
xys.each_with_index do |(x, y), index|
  debug "#{x}, #{y}, #{index}"

  pre = index == 0 ? [0, 0] : status_and_points[index-1]
  status_and_points[index][1-x] = pre[1-x]
  if x == 0
    status_and_points[index][x] = [pre.max + y, pre[0]].max
  else
    status_and_points[index][x] = [pre[0] + y, pre[1]].max
  end
end

debug status_and_points
puts status_and_points[-1].max
