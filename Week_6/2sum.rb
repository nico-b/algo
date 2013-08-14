#!/usr/bin/env ruby
require 'set'

def read_file(file)
  puts "Start read file"

  integers_set = Set.new []
  integers_array = []

  IO.foreach(file) {|line|
    integers_array << line.to_i
    integers_set << line.to_i
  }

  puts "End read file"

  return integers_array.sort, integers_set
end

def two_sum(integers_array, integers_set,start_t,end_t)

  nb_matching_pairs = 0

  (start_t..end_t).each do |t|

    integers_array.each do |x|

      break if x > t/2

      y = t - x
      if integers_set.include?(y) and x != y
        nb_matching_pairs = nb_matching_pairs + 1
        break #valid t
      end
    end

  end

  return nb_matching_pairs

end

#requires JRuby to correctly use multithreading
def compute_multithread(file, start_t, end_t)

  start = Time.now

  integers_array, integers_set = read_file(file)
  nb_matching_pairs_t1 = 0
  nb_matching_pairs_t2 = 0
  nb_matching_pairs_t3 = 0
  nb_matching_pairs_t4 = 0

  t1 = Thread.new{nb_matching_pairs_t1 = two_sum(integers_array,integers_set,-10000,-5000)}
  t2 = Thread.new{nb_matching_pairs_t2 = two_sum(integers_array,integers_set,-4999,0)}
  t3 = Thread.new{nb_matching_pairs_t3 = two_sum(integers_array,integers_set,1,5000)}
  t4 = Thread.new{nb_matching_pairs_t4 = two_sum(integers_array,integers_set,5001,10000)}


  t1.join()
  t2.join()
  t3.join()
  t4.join()

  total_matching_pairs = nb_matching_pairs_t1 + nb_matching_pairs_t2 + nb_matching_pairs_t3 + nb_matching_pairs_t4
  puts "matching pairs : #{total_matching_pairs}"
  puts "runtime : #{Time.now - start}"

  return total_matching_pairs

end

compute_multithread('2sum.txt',-10000,10000)


