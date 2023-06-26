n, m = gets.split.map(&:to_i)

directions = 0.upto(n).each_with_object([]) do |dx, arr|
  dx.upto(n).each do |dy|
    square_dist = dx ** 2 + dy ** 2
    break if square_dist > m
    next if square_dist < m
    arr << [dx, dy]
    arr << [dy, dx]
  end
end

q = Queue.new
q.push([0,0])
ans = Array.new(n) {Array.new(n, -1)}
ans[0][0] = 0
sign_lists = [1, -1].repeated_permutation(2)

while !q.empty?
  x, y = q.pop
  directions.each do |dx, dy|
    sign_lists.each do |sign_x, sign_y|
      following_x = x + dx * sign_x
      following_y = y + dy * sign_y
      next if following_x < 0 || n <= following_x
      next if following_y < 0 || n <= following_y
      next if ans[following_x][following_y] != -1

      ans[following_x][following_y] = ans[x][y] + 1
      q.push([following_x, following_y])
    end
  end
end

puts ans
