require 'set'

n = gets.to_i
flaver_and_scores = n.times.map { gets.split.map(&:to_i) }
flaver_and_scores = flaver_and_scores.sort_by { _1[1] }.reverse

flavers = [].to_set
ans = 0
max_score = flaver_and_scores[0][1]

flaver_and_scores.each do |f, s|
  if flavers.empty?
    flavers << f
    next
  end

  if flavers.include?(f)
    ans = [ans, max_score + (s / 2)].max
  else
    ans = [ans, max_score + s].max
    break
  end
end

puts ans

