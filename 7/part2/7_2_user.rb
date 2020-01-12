# frozen_string_literal: true

require 'pry'
require './7_2_main.rb'

trian = Triangle.new(3, 4, 5)
puts 'It is triangle.'
puts "side a = #{trian.a}"
puts "side b = #{trian.b}"
puts "side c = #{trian.c}"
puts "Square of triangle = #{trian.square}"

puts ''

quadr = Quadrangle.new(10, 9, 3)
puts 'It is quadrangle.'
puts "side a = #{quadr.a}"
puts "side b = #{quadr.b}"
puts "diag c = #{quadr.c}"
puts "Square of quadrangle = #{quadr.square}"
