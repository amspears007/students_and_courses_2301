class Student
  attr_reader :name, 
              :age, 
              :scores

  def initialize(info)
    @name = info[:name]
    @age = info[:age]
    @scores = []
  end

  def log_score(score)
    scores << score
  end

  def grade
    scores.sum.fdiv(scores.count)
  end
end
