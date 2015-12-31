module Util
  def self.reverse matrix
    cols = matrix.size
    rows = matrix.first.size

    rows.times.map{ Array.new cols }.tap do |v|
      rows.times do |row|
        cols.times do |col|
          v[row][col] = matrix[col][row]
        end
      end
    end
  end
end
