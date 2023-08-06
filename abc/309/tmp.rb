n = 10
m = 10 ** 9
a = Array.new(n) { Array.new(3) { rand(m) } }

a.each { pp _1 }
