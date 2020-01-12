# frozen_string_literal: true

require 'pry'

def write_figure(mas)
  unless mas.is_a?(Array) && mas.length.between?(4, 5)
    return 'Error. Mas is an array, length = (4 or 5)!'
  end
  return 'Error. type is a 1 or 2' unless mas[0].between?(1, 2)
  if mas[0].eql?(1) && !mas.length.eql?(5)
    return 'Error. type 1 need a 5 number'
  end

  if mas[0].eql?(2)
    return 'Error. type 2 need a 4 number' unless mas.length.eql?(4)
    return 'Error. R is a positive number.' unless mas[3].positive?
  end

  File.new('figure.txt', 'w').close unless File.exist? 'figure.txt'
  File.open('figure.txt', 'a') { |f| f.puts(mas.map(&:to_s).inject('') { |ac, n| ac + ' ' + n }) }
end
# binding.pry
