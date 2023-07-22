last_number = 0
is_yes = true
gets.split.each do |x|
  i = x.to_i
  is_yes &= i >= last_number
  is_yes &= i >= 100 && i <= 675
  is_yes &= i % 25 == 0
  last_number = i
end

puts is_yes ? 'Yes' : 'No'
