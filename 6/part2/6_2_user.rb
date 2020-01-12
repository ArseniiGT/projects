# frozen_string_literal: true

require 'pry'
require './6_2_main.rb'

puts 'Input precision.'
prec = gets.to_f
if prec <= 0
  puts 'Error. Precision is a number > 0.'
  exit
end

puts 'First < ' + prec.to_s + ' is ' + find_first_en(prec).to_s
