# frozen_string_literal: true

# Ruby 2.3
load 'function_to_solve1.rb'
puts 'Введите точность(прим. 0.001)'
a = gets.to_f
res = integrate(0, 1, a, &method(:function))
puts "Значение: #{res[0]}"
puts "Количество разбиений: #{res[1]}"
