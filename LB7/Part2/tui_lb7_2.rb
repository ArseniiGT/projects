# frozen_string_literal: true

# tui_lb7_2
require './lb7_2.rb'
puts 'Введите слово:'
a = Word2.new(gets.chomp)
puts 'Вывод слова:'
a.print
puts "Длина слова по запросу:#{a.size}"
a.all_info
puts "Гласных в слове:#{a.count_of_vowels}"
