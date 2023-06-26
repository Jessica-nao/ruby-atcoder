gets.to_i
is_yes = (gets.split & %w(and not that the you)).size > 0
puts is_yes ? "Yes" : "No"
