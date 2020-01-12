# frozen_string_literal: true

require 'pry'
require './7_1_main.rb'

if File.exist? 'figure.txt'
  puts 'Delete previous file? (y or n)'
  File.delete 'figure.txt' if gets.chomp.eql? 'y'
end

puts 'Input number of figures'
num = gets.to_i
if num < 1
  puts 'Error. Programm need a number > 0.'
  exit
end

num.times do |i|
  puts "Input figure (type and parameters) #{i + 1}/#{num}"
  write_figure(gets.split.map(&:to_i))
end
