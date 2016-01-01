class Matrix
  def initialize
    @v = 5.times.map{ [0,0,0,0,0] }
  end

  def [] row
    @v[row]
  end

  def value
    @v
  end

  def update value
    @v = value
  end
end

class MatrixDelegator
  attr_accessor :matrix, :knowns
  def initialize m
    self.matrix = m
    self.knowns = []
  end

  def shot_at row, col
    self.knowns << [row, col]
  end

  def [] row
    matrix[row].map.with_index do |element, col|
      if self.knowns.include? [row,col]
        element == 0 ? '/' : 'X'
      else
        ' '
      end
    end
  end
end
