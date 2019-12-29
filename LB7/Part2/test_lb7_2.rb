# frozen_string_literal: true

# test_lb7_2.rb
require './lb7_2.rb'
require 'minitest/autorun'
# Test class
class Test1 < MiniTest::Unit::TestCase
  def test_1
    a = Word.new 'пример текста'
    assert_equal a.word, 'пример'
  end

  def test_2
    a = Word.new 'пример текста'
    assert_equal a.size, 6
  end

  def test_3
    a = Word2.new 'пример текста'
    assert_equal a.size, 6
  end

  def test_4
    a = Word2.new 'пример текста'
    assert_equal a.count_of_vowels, 2
  end

  def test_5
    a = Word2.new
    assert_equal a.size, 0
  end
end
