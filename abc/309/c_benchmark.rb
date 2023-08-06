require 'benchmark'
n = 300_000
m = 10 ** 9
a = Array.new(n) { Array.new(3) { rand(m) } }

Benchmark.bm do |x|
  x.report('sort_by first el') { a.sort_by { |t, *_| t } }
  x.report('sort_by whole list') { a.sort_by { _1 } }
  x.report('sort whole list') { a.sort }
end
