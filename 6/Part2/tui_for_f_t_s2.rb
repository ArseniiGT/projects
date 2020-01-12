# frozen_string_literal: true

# Ruby 2.3
load 'function_to_solve2.rb'
puts 'Введите точность(прим. 0.001)'
a = gets.to_f
puts integrate(0, 1, a, &method(:function))
