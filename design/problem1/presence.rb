class Presence

  attr_accessor :student, :course
  
  def initialize(student, course)
    @student = student
    @course = course  
  end
end