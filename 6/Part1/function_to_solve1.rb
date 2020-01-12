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
  i = 1
  res = 0
  loop do
    i += 1
    res = integr_w_n_div(aaa, bbb, i, &block)
    break if (0.4297983844828 - res).abs < accuracy
  end
  [res, i]
end
