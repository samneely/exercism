class Squares

  def initialize(number)
    @natural_numbers = [*1..number]
  end

  def square_of_sums
    sum = @natural_numbers.inject(:+)
    square_number(sum)
  end

  def sum_of_squares
    squares = @natural_numbers.map { |n| square_number(n) }
    squares.inject(:+)    
  end
  
  def difference
    square_of_sums - sum_of_squares
  end

  private

  def square_number(number)
    number**2
  end
end
