n, q = gets.split.map(&:to_i)
left_stocks = [2] * n
q.times do
  ivent_type, player_num = gets.split.map(&:to_i)
  player_num -= 1
  case ivent_type
  when 1
    left_stocks[player_num] -= 1
  when 2
    left_stocks[player_num] = 0
  when 3
    puts left_stocks[player_num].zero? ? 'Yes' : 'No'
  end
end
