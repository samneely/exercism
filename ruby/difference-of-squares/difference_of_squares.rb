class Squares

  def initialize(number)
    @natural_numbers = [*1..number]
  end

  def square_of_sums
    sums = @natural_numbers.inject(:+)
    sums**2
  end

  def sum_of_squares
    squares = @natural_numbers.map { |n| n**2 }
    squares.inject(:+)    
  end
  
  def difference
    square_of_sums - sum_of_squares
  end
end
