require 'set'
def main
  n, m = gets.split.map(&:to_i)
  given_orders = m.times.each_with_object(Array.new(n+1) {Set.new}) do |_, arr|
    x, y = gets.split.map(&:to_i)
    arr[x].add(y)
  end
  pp given_orders

  # これじゃ全然ダメだった！
  if given_orders.filter {|v| v.size == 1}.size != n-1
    puts "No"
    return
  end
end

main
