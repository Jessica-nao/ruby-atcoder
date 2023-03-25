def debug(object, is_debug: false)
  pp object if is_debug
end

n, m, k = gets.split.map(&:to_i)

takahashi_sugar, takahashi_water = n.times.map{ gets.split.map(&:to_i) }.transpose
aoki = m.times.map{ gets.split.map(&:to_i) }

ans = (0..(1.0)).bsearch do |target_concentration|
  debug(target_concentration)

  takahashi_compared = n.times.map do |i|
    takahashi_sugar[i] - target_concentration * (takahashi_sugar[i] + takahashi_water[i])
  end.sort
  debug("takahashi_compared: #{takahashi_compared}")

  over_count = aoki.map do |sugar, water|
    aoki_compared = sugar - target_concentration * (sugar + water)
    minimum_index = takahashi_compared.bsearch_index{|x| x + aoki_compared >= 0} || n
    n - minimum_index
  end.sum

  debug(over_count)
  k > over_count
end

puts ans * 100
