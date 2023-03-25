require 'set'
def debug(object, is_debug: false)
  pp object if is_debug
end

n, q = gets.split.map(&:to_i)
last_called = 0
called_but_not_gone = SortedSet.new([])

q.times do |i|
  event_type, x = gets.split.map(&:to_i)
  case event_type
  when 1
    last_called += 1
    called_but_not_gone.add(last_called)
  when 2
    called_but_not_gone.delete(x)
  when 3
    puts called_but_not_gone.first
  end
  debug("i = #{i}")
  debug("last_called = #{last_called}")
  debug("called_but_not_gone = #{called_but_not_gone}")
  debug("--------------------------------")
end
