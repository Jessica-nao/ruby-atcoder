arr = [1, 1, 1, 1, 1]

5.times.each do |i|
  pre = i == 0 ? 0 : arr[i-1]
  arr[i] = pre + arr[i]
end

pp arr
