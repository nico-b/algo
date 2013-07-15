#!/usr/bin/env ruby

def read_array(file)
  int_array = []
  File.open(file) do |f|
    while (l = f.gets ) do
      int_array << l.to_i
    end

  end
  int_array
end

def count_inversions(int_array)

	total_length = int_array.length

	if total_length == 1
		return 0, int_array
	else
		left_part = int_array.slice(0,total_length/2)
		right_part = int_array.slice(total_length/2..total_length)
		
		inv_left, left_sorted_part = count_inversions(left_part)
		inv_right, right_sorted_part = count_inversions(right_part)
		
		inv_split, sorted_array = merge_and_count_split_inversions(left_sorted_part,right_sorted_part)
		
		return inv_left + inv_right + inv_split, sorted_array
	end	
	
end

def merge_and_count_split_inversions(left, right)
	
	i = 0
	j = 0
	inv_split = 0
	sorted_array = []

    while i <= left.length-1 and j <= right.length-1
      if left[i] <= right[j]
        sorted_array << left[i]
        i = i + 1
      else
        sorted_array << right[j]
        inv_split += left.length - i
        j = j + 1
      end
    end
    
    if not left[i]
      sorted_array.concat(right.slice(j,right.length))
    elsif not right[j]
      sorted_array.concat(left.slice(i,left.length))
    end
   
	return inv_split, sorted_array
end	

puts "Starting algorithm"

big_array = read_array("IntegerArray.txt")
start = Time.now

total_inv, sorted_array = count_inversions(big_array)

puts "Nb inversions : #{total_inv}"
puts "runtime: #{Time.now - start}"