n, m = gets.split.map(&:to_i)
@open_cans = []
@close_cans = []
@openers = []

n.times do
  t, x = gets.split.map(&:to_i)
  case t
  when 0
    @open_cans << x
  when 1
    @close_cans << x
  when 2
    @openers << x
  end
end

def update_tmp!
  while @left_count > 0
    if @can_open > 0 && !@close_cans.empty?
      @tmp += @close_cans.shift
      @can_open -= 1
    elsif !@openers.empty?
      @can_open += @openers.shift
    else
      break
    end
    @left_count -= 1
  end
end

# 全部昇順にソートする
@open_cans = @open_cans.sort.reverse[...m]
@close_cans = @close_cans.sort.reverse
@openers = @openers.sort.reverse

# まずは、open_cans を全て使う場合
@tmp = @open_cans.sum

@left_count = m - @open_cans.size
@can_open = 0

update_tmp!
ans = @tmp

# 1つずつ、open_cans の使う数を減らしていく
@open_cans.reverse.each do |can|
  # pp "can: #{can}, @tmp: #{@tmp}, ans: #{ans}, @left_count: #{@left_count}, @can_open: #{@can_open}"
  @tmp -= can
  @left_count += 1
  update_tmp!
  ans = [@tmp, ans].max
end

pp ans
