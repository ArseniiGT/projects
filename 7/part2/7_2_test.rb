# frozen_string_literal: true

require 'minitest/autorun'
require './7_2_main'
require 'pry'

# Test for work with file
class TestMathFunc < MiniTest::Unit::TestCase
  N = 5
  PREC = 0.000001
  def setup
    @val = []
    @ans = []
    @val[0] = [3, 4, 5]
    @ans[0] = 6
    @val[1] = [1, 1, 1]
    @ans[1] = 0.433012702
    @val[2] = [2.3, 3, 4.5]
    @ans[2] = 3.111655508
    @val[3] = [1.5, 2, 1]
    @ans[3] = 0.726184377
    @val[4] = [7, 8.5, 10]
    @ans[4] = 29.27182679
  end

  def test_trian_square
    N.times do |num|
      val = @val[num]
      trian = Triangle.new(*val)
      assert_in_delta(@ans[num], trian.square, PREC, 'test square for triangle ' + val.to_s)
    end
  end

  def test_quadr_square
    N.times do |num|
      val = @val[num]
      quadr = Quadrangle.new(*val)
      assert_in_delta(@ans[num] * 2, quadr.square, PREC, 'test square for quadrangle ' + val.to_s)
    end
  end

  def test_reader_trian
    trian = Triangle.new(2, 2, 3)
    assert_equal(2, trian.a, 'test reader triangle (side a)')
    assert_equal(2, trian.b, 'test reader triangle (side b)')
    assert_equal(3, trian.c, 'test reader triangle (side c)')
  end

  def test_reader_quadr
    quadr = Quadrangle.new(2, 2, 3)
    assert_equal(2, quadr.a, 'test reader quadrangle (side a)')
    assert_equal(2, quadr.b, 'test reader quadrangle (side b)')
    assert_equal(3, quadr.c, 'test reader quadrangle (diag c)')
  end

  def test_relations
    quadr = Quadrangle.new(1, 2, 3)
    trian = Triangle.new(1, 2, 3)
    assert_instance_of(Quadrangle, quadr, 'test relations')
    assert_instance_of(Triangle, trian, 'test relations')
    assert_equal(true, quadr.is_a?(Triangle), 'test relations')
  end
end
