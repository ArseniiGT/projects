# frozen_string_literal: true

# tui_lb7_1
require './lb7_1'
a = Text.new
a.clear
puts 'Вывод:'
a.add_line 1, 1, 2, 4
a.add_circle 5, 4, 3
a.add_circle 1, 2, 3
a.add_circle 0, 0, 1
a.print_self
