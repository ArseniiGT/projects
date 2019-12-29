# frozen_string_literal: true

# Ruby 2.3
load 'function_to_solve3.rb'
puts 'Введите количество отрезков разбиения'
a = gets.to_i
puts 'integral from -1 to 4 of x + cos(x) dx ='
puts integr_w_n_div(-1, 4, a, ->(x) { x + Math.cos(x) })
puts 'integral from 0 to 2 of tan(x + 1) / (x + 1) dx ='
with_block = integr_w_n_div(0, 2, a) do |x|
  Math.tan(x + 1) / (x + 1)
end

puts with_block
