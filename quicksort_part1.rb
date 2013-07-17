#!/usr/bin/env ruby

def read_array(file)
  int_array = []
  
  IO.foreach(file) {|line| int_array << line.to_i}

  int_array
end

puts "Starting algorithm"

big_array = read_array("QuickSort.txt")
start = Time.now

#TODO
total_inv = 0

puts "Nb inversions : #{total_inv}"
puts "runtime: #{Time.now - start}"