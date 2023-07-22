class Solver
  attr_accessor :teams
  attr_reader :hate, :num, :team_count

  def initialize(hate, num, team_count)
    @teams = []
    @hate = hate
    @num = num
    @team_count = team_count
  end

  def dfs(now)
    if now == num
      is_right_grouping = teams.size == team_count
      return is_right_grouping ? 1 : 0
    end

    ans = 0

    teams.each do |team|
      next unless (team & hate[now]).empty?

      team << now
      ans += dfs(now + 1)
      team.pop
    end

    if teams.size < team_count
      teams.push([now])
      ans += dfs(now + 1)
      teams.pop
    end

    ans
  end
end

n, t, m = gets.split.map(&:to_i)
hate = Array.new(n) { [] }
m.times do
  a, b = gets.split.map(&:to_i)
  hate[a - 1] << (b - 1)
  hate[b - 1] << (a - 1)
end

puts Solver.new(hate, n, t).dfs(0)
