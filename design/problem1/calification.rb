class Calification
  
  attr_accessor :test, :student, :grade

  def initialize(test, student, grade=0)
    @test = test
    @student = student
    @grade = grade
  end
end