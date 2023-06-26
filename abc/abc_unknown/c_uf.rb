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

n, m = gets.split.map(&:to_i)
uf = UnionFind.new(n)
m.times do
  a, b = gets.split.map{_1.to_i - 1}
  uf.unite(a, b)
end
puts m - n + uf.size
