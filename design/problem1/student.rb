class Student

  attr_accessor :name, :dni, :presences, :califications

  def initialize(name, dni)
    @name = name
    @dni = name
    @courses = Array.new
    @presences = Array.new
  end

  def add_course(course)
    self.courses.push(course)
  end

  def add_califications(calification)
    self.califications.push(calification)
  end

  def grades_avg(course)
    califications = self.califications.select { |calification| calification.test.course == course }
    califications.inject { |acum, elem| acum + el } / califications.size
  end
end