#!/usr/bin/env ruby

def count_inversions(int_array)

	total_length = int_array.length
	i = 0
	count = 0

	while i < total_length
		j = i + 1
		while j < total_length
			if int_array[i] > int_array[j]
				count = count + 1
			end
			j = j + 1
		end	
		i = i + 1
	end
	count
end

