class Test

  attr_accessor :name, :course, :califications

  def initialize(name, course)
    @name = name
    @course = course
    @califications = Array.new
  end
end