# frozen_string_literal: true

# test_for_solve.rb
require './function_to_solve3'
require 'minitest/autorun'
# Test class
class Test1 < MiniTest::Unit::TestCase
  def test_1
    @res = integr_w_n_div(-1, 4, 200, ->(x) { x + Math.cos(x) })
    assert_in_delta @res, 7.583946823064755, 0.1
  end

  def test_2
    @res = integr_w_n_div(-1, 4, 100, ->(x) { x + Math.cos(x) })
    assert_in_delta @res, 7.583946823064755, 0.1
  end

  def test_3
    @res = integr_w_n_div(0, 2, 5) { |x| Math.tan(x + 1) / (x + 1) }
    assert_in_delta @res, 0.6, 0.1
  end

  def test_4
    @res = integr_w_n_div(0, 2, 50) { |x| Math.tan(x + 1) / (x + 1) }
    assert_in_delta @res, 1.9, 0.1
  end
end
