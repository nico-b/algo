#!/usr/bin/env ruby

def read_array(file)
  int_array = []
  
  IO.foreach(file) {|line| int_array << line.to_i}

  int_array
end

def find_median_index(array, l)

  array_length = array.length

  if array_length == 1
    return 0
  else

    first = array[0]
    last_index = array_length - 1
    last = array[last_index]

    if array_length % 2 == 0
      middle_index = array_length / 2 - 1
    else
      middle_index = (array_length + 1) / 2 - 1
    end

    middle = array[middle_index]

    if first > middle
      if first < last
        return 0 + l
      else
        middle > last ? middle_index + l : last_index + l
      end
    else
      if middle < last
        return middle_index + l
      else
        first > last ? 0 + l : last_index + l
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