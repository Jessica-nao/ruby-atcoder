samples = %w[ACE BDF CEG DFA EGB FAC GBD]
is_yes = samples.include?(gets.chomp)
puts is_yes ? 'Yes' : 'No'
