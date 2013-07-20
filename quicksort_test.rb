require 'test/unit'
require_relative 'quicksort'

class QuickSortTest < Test::Unit::TestCase

  def test_find_median_index_odd
    assert_equal 2, find_median_index([2,1,4,3,7], 0)
  end

  def test_find_median_index_even
    assert_equal 0, find_median_index([5,1,2,3,7,8], 0)
  end

  def test_q1
    big_array = read_array("QuickSort.txt")
    start = Time.now
    nb_comp_1, sorted_array = quick_sort(big_array, 0, big_array.length - 1, 0, 1)
    puts "Nb comparisons Q1 : #{nb_comp_1}"
    puts "runtime: #{Time.now - start}"
    assert_equal 10000, sorted_array.last
    assert_equal 1, sorted_array.first
  end

  def test_q2
    big_array = read_array("QuickSort.txt")
    start = Time.now
    nb_comp_2, sorted_array = quick_sort(big_array, 0, big_array.length - 1, 0, 2)
    puts "Nb comparisons Q2 : #{nb_comp_2}"
    puts "runtime: #{Time.now - start}"
    assert_equal 10000, sorted_array.last
    assert_equal 1, sorted_array.first
  end

  def test_q3
    big_array = read_array("QuickSort.txt")
    start = Time.now
    nb_comp_3, sorted_array = quick_sort(big_array, 0, big_array.length - 1, 0, 3)
    puts "Nb comparisons Q3 : #{nb_comp_3}"
    puts "runtime: #{Time.now - start}"
    assert_equal 10000, sorted_array.last
    assert_equal 1, sorted_array.first
  end

end