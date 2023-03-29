require 'set'

n = gets.to_i
x = y = 0
has_reached = {
  0 => Set.new([0])
}
is_yes = false

gets.chomp.chars.each do |direction|
  case direction
  when 'R'
    x += 1
  when 'L'
    x -= 1
  when 'U'
    y += 1
  when 'D'
    y -= 1
  end

  # pp "x = #{x}, y = #{y}"
  has_reached[x] ||= Set.new
  if has_reached[x].add?(y).nil?
    # pp has_reached
    is_yes = true
  end
end

puts is_yes ? "Yes" : "No"
