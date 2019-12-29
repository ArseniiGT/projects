# frozen_string_literal: true

# Ruby 2.3
def integr_w_n_div(aaa, bbb, nnn, lambda = nil, &block)
  block = lambda unless lambda.nil?
  res = (-block.call(aaa) + block.call(bbb)) / 2.0
  div = (bbb - aaa).to_f / nnn
  nnn.times do |i|
    res += block.call(aaa + i * div)
  end
  res * div
end
