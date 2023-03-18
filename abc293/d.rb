class UnionFind
  attr_reader :rank, :root

  def initialize(size)
    @rank = Array.new(size, 0)
    @root = size.times.to_a
  end

  def unite(x, y)
    x_root = get_root(x)
    y_root = get_root(y)
    return if x_root == y_root

    if rank[x_root] > rank[y_root]
      @root[y_root] = x_root
    else
      @root[x_root] = y_root
      @rank[y_root] += 1 if rank[x_root] == rank[y_root]
    end
  end

  def get_root(x)
    root[x] == x ? x : (@root[x] = get_root(root[x]))
  end

  def same_root?(x, y)
    get_root(x) == get_root(y)
  end

  def size
    root.map{ |x| get_root(x) }.uniq.size
  end
end

n, m = gets.split.map(&:to_i)
uf = UnionFind.new(n)
cycle_count = 0

m.times do
  first_rope, first_color, second_rope, second_color = gets.split
  first_rope, second_rope = first_rope.to_i - 1, second_rope.to_i - 1

  cycle_count += 1 if uf.same_root?(first_rope, second_rope)
  uf.unite(first_rope, second_rope)
end

not_cycle_couont = uf.size - cycle_count

puts "#{cycle_count} #{not_cycle_couont}"
