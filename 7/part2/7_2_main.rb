# frozen_string_literal: true

require 'pry'

# Triangle is a figure. It can compute square and show sides
class Triangle
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def square
    p = (@a + @b + @c) / 2.0
    (p * (p - @a) * (p - @b) * (p - @c))**(1 / 2.0)
  end
  attr_reader :a, :b, :c
end

# Quadrangle is a figure. It can compute square and show sides and diagonal
class Quadrangle < Triangle
  def square
    super * 2
  end
end

# binding.pry
