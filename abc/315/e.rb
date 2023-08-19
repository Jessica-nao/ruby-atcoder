require 'thread'

n = gets.to_i
@pres = n.times.map do
  cnt, *ps = gets.split.map(&:to_i)
  ps |= []
  ps.map { _1 - 1 }
end

@read = Array.new(n, false)

def dfs(v)
  @read[v] = true
  @pres[v].each do |u|
    next if @read[u]

    dfs(u)
  end
  @ans << v
end

@ans = []
dfs(0)

puts @ans[..-2].map { _1 + 1 }.join(' ')
