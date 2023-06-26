# debug を入れすぎて落ちたっぽい
def debug(obj)
  return if true
  pp obj
end

def solve
  n, m = gets.split.map(&:to_i)
  colors = gets.split.map(&:to_i)
  edges = m.times.each_with_object(Array.new(n) {[]}) do |_, arr|
    u, v = gets.split.map{ _1.to_i - 1 }
    arr[u] << v
    arr[v] << u
  end
  distances = Array.new(n) {[-1] * n}
  distances[n-1][0] = 0
  q = Queue.new
  q << [n-1, 0]
  while !q.empty?
    takahashi, aoki = q.pop
    debug "takahashi = #{takahashi}, aoki = #{aoki}"
    edges[takahashi].each do |following_takahashi|
      edges[aoki].each do |following_aoki|
        next if distances[following_takahashi][following_aoki] != -1
        next if colors[following_takahashi] == colors[following_aoki]

        distances[following_takahashi][following_aoki] = distances[takahashi][aoki] + 1
        debug "dist = #{distances[following_takahashi][following_aoki]}"
        q << [following_takahashi, following_aoki]
        debug "following_takahashi = #{following_takahashi}, following_aoki = #{following_aoki}"
        debug distances
      end
    end
  end
  puts distances[0][n-1]
  debug "--------------------------------"
end

gets.to_i.times { solve }
