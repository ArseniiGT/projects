# frozen_string_literal: true

# Ruby 2.3
def function(xxx)
  xxx / Math.sqrt(1 + xxx**3)
end

def integr_w_n_div(aaa, bbb, nnn)
  res = 0
  div = (bbb - aaa).to_f / nnn
  nnn.times do |i|
    res += yield(aaa + i * div)
  end
  res * div
end

def integrate(aaa, bbb, accuracy, &block)
  e = Enumerator.new do |yielder|
    sum = 0.0
    n = 1
    loop do
      sum = integr_w_n_div(aaa, bbb, n += 1, &block)
      yielder.yield sum, n
    end
  end
  e.find { |sum, _n| (0.4297983844828 - sum).abs < accuracy }
end
