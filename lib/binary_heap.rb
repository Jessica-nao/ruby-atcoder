class BinaryHeap
  attr_reader :size, :array, :order

  # 初期化 O(N)
  # - init: 初期化する配列
  # - order: 向き ( 1: 昇順 , -1: 降順 )
  def initialize(init = [], order = 1)
    @size, @array, @order = init.size, init, order
    @array.unshift(nil)
    (size / 2).downto(1) do |i|
      downheap(i)
    end
  end

  def empty?
    size <= 0
  end

  # 追加 O(logN)
  def push(x)
    @array << x
    upheap(@size += 1)
  end

  # 配列として見たとき、 i 番目の要素を取得する
  # ヒープ順であって、必ずしもソートされているとは限らない
  def [](i)
    array[1 + i]
  end

  alias :<< :push

  # 最大値の取得 O(1)
  def peek
    return nil if empty?
    array[1]
  end

  # 最大値の削除 O(logN)
  def pop
    return nil if empty?
    x = array[1]
    @array[1] = @array.pop
    @size -= 1
    downheap(1)
    x
  end

  private

  def upheap(k)
    while k > 1
      p = k / 2
      break if (array[p] <=> array[k]) != @order
      @array[p], @array[k] = array[k], array[p]
      k = p
    end
  end

  def downheap(k)
    while (i = k * 2) <= size
      j = i + 1
      m = k
      m = i if (array[m] <=> array[i]) == order
      m = j if j <= size and (array[m] <=> array[j]) == order
      break if m == k
      @array[k], @array[m] = array[m], array[k]
      k = m
    end
  end
end
