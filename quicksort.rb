#!/usr/bin/env ruby

def read_array(file)
  int_array = []
  
  IO.foreach(file) {|line| int_array << line.to_i}

  int_array
end

def find_median_index(array, l)

  if array.length == 1
    return 0
  else

    first = array[0]
    last_index = array.length - 1
    last = array[last_index]

    if array.length % 2 == 0
      middle_index = array.length / 2 - 1
    else
      middle_index = (array.length + 1) / 2 - 1
    end

    middle = array[middle_index]

    if first > middle
      if first < last
        return 0 + l
      else
        if middle > last
          return middle_index + l
        else
          return last_index + l
        end
      end
    else
      if middle < last
        return middle_index + l
      else
        if first > last
          return 0 + l
        else
          return last_index + l
        end
      end
    end

  end
end

def quick_sort(array, l, r, nb_comp, exo_question)

  if r - l < 1
    return nb_comp, array
  end

  nb_comp = nb_comp + r - l

  if exo_question == 1
    pivot = array[l]
  elsif exo_question == 2
    pivot = array[r]
    array[l], array[r] = array[r], array[l]
  elsif exo_question == 3
    median_pivot_index = find_median_index(array[l..r], l)
    pivot = array[median_pivot_index]
    array[median_pivot_index], array[l] = array[l], array[median_pivot_index]
  end

  i = l
  pivot_index = l

  (l+1..r).each do |j|
    if array[j] < pivot
      i = i + 1
      array[i], array[j] = array[j], array[i]
    end
  end

  array[i], array[pivot_index] = array[pivot_index], array[i]

  nb_comp, array = quick_sort(array, l, i-1, nb_comp, exo_question)
  nb_comp, array = quick_sort(array, i+1, r, nb_comp, exo_question)

  return nb_comp, array
end  

puts "Starting algorithm"

big_array = read_array("QuickSort.txt")

start = Time.now

nb_comp_1, sorted_array = quick_sort(big_array, 0, big_array.length - 1, 0, 1)
#nb_comp_2, sorted_array = quick_sort(big_array, 0, big_array.length-1, 0, 2)
#nb_comp_3, sorted_array = quick_sort(big_array, 0, big_array.length-1, 0, 3)

puts "Nb comparisons Q1 : #{nb_comp_1}"
#puts "Nb comparisons Q2 : #{nb_comp_2}"
#puts "Nb comparisons Q3 : #{nb_comp_3}"

puts "runtime: #{Time.now - start}"