#!/usr/bin/env ruby

def read_array(file)
  int_array = []
  
  IO.foreach(file) {|line| int_array << line.to_i}

  int_array
end

def count_inversions(int_array)

  total_length = int_array.length
  mid_length = total_length / 2

  if total_length == 1
    return 0, int_array
  else
    left_part = int_array[0,mid_length]
    right_part = int_array[mid_length,total_length]

    inv_left, left_sorted_part = count_inversions(left_part)
    inv_right, right_sorted_part = count_inversions(right_part)

    inv_split, sorted_array = merge_and_count_split_inversions(left_sorted_part,right_sorted_part)

    return inv_left + inv_right + inv_split, sorted_array
  end 

end

def merge_and_count_split_inversions(left, right)

  i = j = inv_split = 0
  sorted_array = []
  left_length = left.length
  right_length = right.length

    while i <= left_length-1 and j <= right_length-1
      left_curr = left[i]
      right_curr = right[j]
      
      if left_curr <= right_curr
        sorted_array << left_curr
        i = i + 1
      else
        sorted_array << right_curr
        inv_split += left_length - i
        j = j + 1
      end

    end
    
    if left[i] == nil
      sorted_array.concat(right[j,right_length])
    elsif right[j] == nil
      sorted_array.concat(left[i,left_length])
    end
   
  return inv_split, sorted_array
end 

puts "Starting algorithm"

big_array = read_array("IntegerArray.txt")
start = Time.now

total_inv, sorted_array = count_inversions(big_array)

puts "Nb inversions : #{total_inv}"
puts "runtime: #{Time.now - start}"