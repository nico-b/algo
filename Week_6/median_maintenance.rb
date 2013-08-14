#!/usr/bin/env ruby
require 'algorithms'

def read_file(file)

  puts "Start read file"

  int_stream = []

  IO.foreach(file) {|line|
    int_stream << line.to_i
  }

  puts "End read file"

  return int_stream

end

def re_balance(h_low, h_high)

  if h_low.size >= h_high.size + 2
    to_move = h_low.max!
    h_high.push(to_move)
  elsif h_high.size >= h_low.size + 2
    to_move = h_high.min!
    h_low.push(to_move)
  end

  return h_low, h_high
end

def median_maintenance(int_stream)

  h_low = Containers::MaxHeap.new
  h_high = Containers::MinHeap.new
  sum_median = 0

  first_el = int_stream[0]

  if h_high.size == 0 and h_low.size == 0
    h_low.push(first_el)
    sum_median = sum_median + first_el
    int_stream.delete_at(0)
  end

  int_stream.each do |new_val|

    if new_val <= h_low.max
      h_low.push(new_val)
    else
      h_high.push(new_val)
    end

    h_low, h_high = re_balance(h_low, h_high)

    if h_low.size >= h_high.size #when sizes are equal (even case), median = k / 2
      sum_median = sum_median + h_low.max
    else
      sum_median = sum_median + h_high.min
    end

  end

  return sum_median % 10000

end

def compute(file)

  start = Time.now

  int_stream = read_file(file)
  sum_median = median_maintenance(int_stream)

  puts "runtime : #{Time.now - start}"

  return sum_median
end



