class Subject
  
  attr_accessor :name, :courses

  def initialize(name)
    @name = name
    @courses = Array.new
  end
end