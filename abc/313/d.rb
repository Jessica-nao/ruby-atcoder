$stdout.sync = true

n, k = gets.split.map(&:to_i)

def request(request_str)
  puts "? #{request_str}"
  result = gets.to_i
  exit if result == -1

  result == 1
end

ans = []

# 1番目から、k+1番目までをまず求める
one_to_k_plus_one = (1..(k+1)).to_a
result_until_k_plus_one = 1.upto(k+1).map do |i|
  request_str = (one_to_k_plus_one - [i]).join(' ')
  request(request_str)
end

sum_until_k_plus_one = result_until_k_plus_one.inject(false) { |result, i| result ^ i }

result_until_k_plus_one.each do |i|
  ans << (sum_until_k_plus_one ^ i)
end

# 残ったk+2番目から、n番目までを求める
# すでに求めた[1番目から、k-1番目まで]と、 i番目(k+2 <= i <= n)でk個
sum_until_k_minus_one = ans[...(k-1)].inject(false) { |result, i| result ^ i }

one_to_k_minus_one_str = (1..(k-1)).to_a.join(' ')
result_after_k_plus_one = (k+2).upto(n).map do |i|
  request_str = "#{one_to_k_minus_one_str} #{i}"
  request(request_str)
end

result_after_k_plus_one.each do |i|
  ans << (sum_until_k_minus_one ^ i)
end

puts "! #{ans.map{ _1 ? 1 : 0 }.join(' ')}"
