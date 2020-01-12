# frozen_string_literal: true
require 'pry'

def trap(a, b, n, func = nil, &block)
  return 'Error. n is a number, n > 1' unless n.is_a?(Integer) && (n > 1)

  a = a.to_f
  b = b.to_f
  step = (b - a) / n
  segments = Enumerator.new do |y|
    num = a + step
    loop do
      y << if func.nil?
             block.call(num)
           else
             func.call(num)
           end
      num += step
    end
  end
  if func.nil?
    ((yield(a) + yield(b)) / 2 + segments.take(n - 1).inject(:+)) * step
  else
    ((func.call(a) + func.call(b)) / 2 + segments.take(n - 1).inject(:+)) * step
  end
end

# binding.pry
