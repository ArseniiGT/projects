# app/models/answer.rb

class Answer < ApplicationRecord
  validates :query, presence: true, uniqueness: true
  before_create :calculate

  def get_solution
    ActiveSupport::JSON.decode(solution)
  end

  private

  def calculate
    n = 0
    a = query.to_i
    res = [[a, a.to_s == a.to_s.reverse]]
    loop do
      break if a.to_s == a.to_s.reverse
      a += a.to_s.reverse!.to_i
      n += 1
      res.push [a, a.to_s == a.to_s.reverse]
      next unless n >= 20_000
      a = nil
      res = []
      break
    end
    self.solution = ActiveSupport::JSON.encode(res)
  end
end
