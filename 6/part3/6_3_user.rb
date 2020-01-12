# frozen_string_literal: true

require 'pry'
require './6_3_main.rb'

puts 'Input a.'
inp = gets
a = inp.to_f
if a.zero? && !inp[0].eql?('0')
  puts 'Error. Programm need a real number.'
  exit
end

puts 'Input b.'
inp = gets
b = inp.to_f
if b.zero? && !inp[0].eql?('0')
  puts 'Error. Programm need a real number.'
  exit
end

puts 'Input number of segments.'
n = gets.to_i
if n < 2
  puts 'Error. Programm need a number > 1.'
  exit
end

fun = ->(x) { x + Math.cos(x) }
print "def_integral from #{a} to #{b} (x + cos x) dx = "
puts trap(a, b, n, fun)
print "def_integral from #{a} to #{b} (tg(x + 1) / (x+1)) dx = "
puts trap(a, b, n) { |x| Math.tan(x + 1) / (x + 1) }
