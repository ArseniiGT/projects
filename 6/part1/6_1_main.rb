# frozen_string_literal: true

require 'pry'

def func(num)
  num.to_f / (num**2 + 2)
end

def find_first_wh(prec)
  unless (prec.is_a? Float) && prec.positive?
    return 'Error. Precision is a number>0'
  end

  num = 1
  num += 1 while func(num) > prec
  num
end

# binding.pry
