n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort
b = gets.split.map(&:to_i).sort.reverse

ok = 1_001_001_001
ng = 0

while (ok - ng).abs > 1
  mid = (ok + ng) / 2
  a_index = a.bsearch_index { |ai| ai > mid } || n
  b_index = b.bsearch_index { |bi| bi < mid } || m
  # pp "mid: #{mid}, a_index: #{a_index}, b_index: #{b_index}"

  a_index >= b_index ? ok = mid : ng = mid
end

puts ok
