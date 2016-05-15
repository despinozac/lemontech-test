class Course
  
  attr_accessor :teacher, :subject, :tests, :presences
  
  def initialize(teacher, subject)
    @teacher = teacher
    @subject = subject
    @tests = Array.new
    @presences = Array.new
  end

  def student_list
    self.presences.map { |presence| presence.student }
  end

  def student_list_avg
    students = self.presences.map { |presence| presence.student }

    students.each { |student| [student, student.grades_avg(self)] }
  end
end