# frozen_string_literal: true

# test_for_solve.rb
require './function_to_solve2.rb'
require 'minitest/autorun'
# Test class
class Test1 < MiniTest::Unit::TestCase
  REF = 0.4297983844828

  def test_1
    del = 0.1

    assert_in_delta REF, integrate(0, 1, del, &method(:function))[0], del
  end

  def test_2
    del = 0.01
    assert_in_delta REF, integrate(0, 1, del, &method(:function))[0], del
  end

  def test_3
    del = 0.001
    assert_in_delta REF, integrate(0, 1, del, &method(:function))[0], del
  end

  def test_4
    del = 0.0001
    assert_in_delta REF, integrate(0, 1, del, &method(:function))[0], del
  end
end
