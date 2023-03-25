class UnionFind
  attr_reader :members, :root

  def initialize(size)
    @root = size.times.to_a
    @members = root.map{ |x| [x] }
  end

  def unite(x, y)
    x_root = get_root(x)
    y_root = get_root(y)
    return if x_root == y_root

    x_root, y_root = y_root, x_root if members[x_root].size > members[y_root].size
    @root[x_root] = y_root
    @members[y_root].push *@members[x_root]
  end

  def get_root(x)
    root[x] == x ? x : (@root[x] = get_root(root[x]))
  end

  def same_root?(x, y)
    get_root(x) == get_root(y)
  end

  def is_root?(x)
    get_root(x) == x
  end

  def size
    root.map{ |x| get_root(x) }.uniq.size
  end

  def component(x)
    @members[get_root(x)]
  end
end

def debug(object)
  pp object if false
end

n, m = gets.split.map(&:to_i)
edges = Array.new(n) { Array.new(0) }
m.times do
  u, v = gets.split.map{ |i| i.to_i - 1 }
  edges[u] << v
  edges[v] << u
end
uf = UnionFind.new(n)

debug(edges)

0.upto(n-1) do |v|
  edges[v].each do |u|
    uf.unite(v, u)
  end
end

is_totally_ok = true

0.upto(n-1) do |v|
  next unless uf.is_root?(v)

  debug(uf.component(v))

  group_members = uf.component(v)
  total_eadge_count = group_members.inject 0 do |edge_count, i|
    debug("member #{i}")
    edge_count += edges[i].size
  end
  total_eadge_count /= 2
  debug(total_eadge_count)
  debug(group_members.size)
  is_totally_ok &= total_eadge_count == group_members.size
end

puts is_totally_ok ? "Yes" : "No"
