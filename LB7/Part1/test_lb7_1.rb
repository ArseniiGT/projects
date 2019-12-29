# frozen_string_literal: true

# test_lb7_2.rb
require './lb7_1.rb'
require 'minitest/autorun'
# Test class
class Test1 < MiniTest::Unit::TestCase
  def test_1
    a = Text.new
    a.clear
    a.add_line 1, 1, 2, 4
    a.add_circle 5, 4, 3
    assert_equal a.all, ['1 1 1 2 4', '2 5 4 3']
  end

  def test_2
    a = Text.new
    a.clear
    a.add_circle 678, 910, 911
    assert_equal a.all, ['2 678 910 911']
  end

  def test_3
    a = Text.new
    a.clear
    a.add_line 3.1415, 0, 0, 0
    assert_equal a.all, ['1 3.1415 0 0 0']
  end

  def test_4
    a = Text.new
    a.clear
    assert_equal a.all, []
  end
end
