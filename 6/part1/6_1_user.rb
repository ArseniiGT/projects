# frozen_string_literal: true

require 'pry'
require './6_1_main.rb'

puts 'Input precision.'
prec = gets.to_f
if prec <= 0
  puts 'Error. Precision is a number > 0.'
  exit
end

puts 'First < ' + prec.to_s + ' is ' + find_first_wh(prec).to_s
