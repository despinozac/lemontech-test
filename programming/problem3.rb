class Knight

  LEGAL_X = [2, 1, -1, -2, -2, -1, 1, 2]
  LEGAL_Y = [1, 2, 2, 1, -1, -2, -2, -1]


  attr_accessor :size, :primary_x, :primary_y, :board


  def initialize(size, primary_x, primary_y)
    @size = size
    @primary_x = primary_x
    @primary_y = primary_y
    @board = Array.new(size){Array.new(size){"#"}}
  end

  def solve
    puts "No solution" if solve_back(primary_x, primary_y, 1)
  end

  def solve_back(x, y, cont)

    board[x][y] = cont

    if end?(cont)
      
      board.each do |row|
        puts row.each { |p| p }.join(" ")
      end

      exit
    end 

    8.times do |i|
      pos_x = x + LEGAL_X[i]
      pos_y = y + LEGAL_Y[i]

      if in_bounds?(pos_x, pos_y) && can_land?(pos_x, pos_y)
        solve_back(pos_x, pos_y, cont + 1)
      end
    end
    board[x][y] = "#"
  end

  def in_bounds?(x, y)
    (0...self.size).include?(x) && (0...self.size).include?(y)
  end

  def can_land?(x,y)
    board[x][y] == "#"
  end

  def end?(cont)
    ending == cont
  end

  def ending
    self.size * self.size
  end
end

