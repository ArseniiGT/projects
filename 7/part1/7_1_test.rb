# frozen_string_literal: true

require 'minitest/autorun'
require './7_1_main'
require 'pry'

# Test for work with file
class TestMathFunc < MiniTest::Unit::TestCase
  N = 10
  def setup
    File.new('figure.txt', 'w').close
  end

  def test_ans_and_val
    fig = []
    fig << rand(1..2)
    2.times { fig << rand(-50..49) }
    fig << rand(1..100)
    fig << rand(-50..49) if fig[0].eql?(1)
    write_figure(fig)
    File.open('figure.txt') do |f|
      from_file = f.gets.chomp.split.map(&:to_i)
      assert_equal(fig, from_file, 'test for ' + fig.to_s)
    end
    clear
  end

  def test_n_times_ans_and_val
    N.times do
      File.new('figure.txt', 'w').close
      test_ans_and_val
    end
  end

  def test_bad_type
    ans = 'Error. type is a 1 or 2'
    assert_equal(ans, write_figure([3, 1, 2, 3]), 'test by bad type')
    clear
  end

  def test_by_not_array
    ans = 'Error. Mas is an array, length = (4 or 5)!'
    assert_equal(ans, write_figure(145), 'test by not array')
    clear
  end

  def test_array_with_incorrect_length
    ans = 'Error. Mas is an array, length = (4 or 5)!'
    assert_equal(ans, write_figure([1, 2, 3, 4, 5, 4]), 'test array with incorrect length')
    clear
  end

  def test_incorrect_param_line
    ans = 'Error. type 1 need a 5 number'
    assert_equal(ans, write_figure([1, 2, 3, 4]), 'test incorrect parameters line')
    clear
  end

  def test_incorrect_param_circle
    ans = 'Error. type 2 need a 4 number'
    assert_equal(ans, write_figure([2, 2, 3, 4, 5]), 'test incorrect parameters circle')
    clear
  end

  def test_incorrect_radius_circle
    ans = 'Error. R is a positive number.'
    assert_equal(ans, write_figure([2, 3, -4, 0]), 'test incorrect radius circle')
    clear
  end

  def clear
    File.delete 'figure.txt'
  end
end
