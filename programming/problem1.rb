class Integer
  def fact
    (1..self).inject(:*)
  end

  def count_zeros
    self.to_s.count("0")
  end
end

def count_zeros(n)
  n.fact.count_zeros
end