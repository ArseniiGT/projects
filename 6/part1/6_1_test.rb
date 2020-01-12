# frozen_string_literal: true

require 'minitest/autorun'
require './6_1_main'
require './for test/main'
require 'pry'

# Test for number series
class TestMathFunc < MiniTest::Unit::TestCase
  N = 10
  def test_ans_and_val
    # binding.pry
    N.times do |_num|
      prec = rand(1..10_000).to_f / 10_000
      assert_equal(find_first_en(prec), find_first_wh(prec), 'test for ' + prec.to_s)
    end
  end

  def test_by_zero
    ans = 'Error. Precision is a number>0'
    assert_equal(ans, find_first_wh(0), 'test zero is a precision')
  end

  def test_by_negative_num
    ans = 'Error. Precision is a number>0'
    assert_equal(ans, find_first_wh(-1), 'test negative number is a precision')
  end
end
