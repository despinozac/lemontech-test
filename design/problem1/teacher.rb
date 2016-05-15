class Teacher

  attr_accessor :name, :dni, :courses

  def initialize(name, dni)
    @name = name
    @dni = dni
    @courses = Array.new
  end

  def add_course(course)
    self.courses.push(course)
  end
end