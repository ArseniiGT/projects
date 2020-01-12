# frozen_string_literal: true

require 'pry'

def func(num)
  num.to_f / (num**2 + 2)
end

def find_first_en(prec)
  unless (prec.is_a? Float) && prec.positive?
    return 'Error. Precision is a number>0'
  end

  num_ser = Enumerator.new do |y|
    num = 1
    loop do
      y << func(num)
      num += 1
    end
  end
  num_ser.find_index { |n| n < prec } + 1
end

# binding.pry
