class WordProblem
  def initialize(question)
    @question = question
  end

  def answer
    raise ArgumentError unless @question.match?(/\d+/)
    raise ArgumentError if @question.include?("cubed")

    calculation_segments = @question
      .gsub(/What is /, "")
      .gsub(/plus/, "+")
      .gsub(/minus/, "-")
      .gsub(/multiplied by/, "*")
      .gsub(/divided by/, "/")
      .gsub(/raised to the/, "**")
      .gsub(/th power/, "") # what about 3rd power?
      .gsub(/\?/, "")
      .split(" ")

    calculation_result = calculation_segments.shift.to_i
    calculation_segments.each_slice(2) do |(operator, next_number)|
      calculation_result = calculation_result.send(operator, next_number.to_i)
    end
    calculation_result
  end
end
