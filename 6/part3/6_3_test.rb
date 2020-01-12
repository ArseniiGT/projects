# frozen_string_literal: true

require 'minitest/autorun'
require './6_3_main'
require 'pry'

# Test for my math function
class TestMathFunc < MiniTest::Unit::TestCase
  N = 5
  PREC = 0.000001
  def setup
    @val = []
    @ans = []
    @val[0] = [1, 5, ->(x) { x }]
    @ans[0] = 12
    @val[1] = [2.7, 5.68, ->(x) { Math.cos(x) + 3 }]
    @ans[1] = 7.945351567837202
    @val[2] = [-4.2, 10, ->(x) { Math.sin(x) + Math.cos(x) }]
    @ans[2] = -1.066786175567205
    @val[3] = [0, 2, ->(x) { x**4 + x**3 + 1 }]
    @ans[3] = 12.4
    @val[4] = [-3, 2, ->(x) { x**3 + x**2 + x + 3 }]
    @ans[4] = 7.916666666666667
    @n = 10_000
  end

  def test_ans_and_val
    # binding.pry
    N.times do |num|
      val = @val[num]
      assert_in_delta(@ans[num], trap(val[0], val[1], @n, val[2]), PREC, 'test for ' + val.to_s)
    end
  end

  def test_bad_num_of_segments
    ans = 'Error. n is a number, n > 1'
    assert_equal(ans, trap(1, 5, 0, ->(x) { x }), 'test bad number of segments (n < 2)')
  end
end
