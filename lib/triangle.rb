require 'pry'

class Triangle
  attr_reader :s1, :s2, :s3
  
  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end

  def kind
    validate_triangle
    if s1 == s2 && s2 == s3
      :equilateral
    elsif s1 == s2 || s2 == s3 || s1 == s3
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [s1, s2, s3].all?(&:positive?)
  end

  def two_sides_are_greater?
    s1 + s2 > s3 && s1 + s3 > s2 && s2 + s3 > s1
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && two_sides_are_greater? 
  end

  class TriangleError < StandardError
    def message 
      "Invalid Triangle!"
    end
  end

end

test = Triangle.new(1,1,1)
test2 = Triangle.new(2,2,3)
test3 = Triangle.new(2,4,2)
test4 = Triangle.new(0,1,2)
test.kind
test2.kind
test3.kind
test4.kind
binding.pry