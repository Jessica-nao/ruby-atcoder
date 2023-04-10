puts gets.chomp.chars.map{((1 - _1.to_i) + '0'.ord).chr}.join
