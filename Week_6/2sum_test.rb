require 'test/unit'
require_relative '2sum'

class TwoSumTest < Test::Unit::TestCase

  def test_read_file
    integers_array, integers_set = read_file('2sum_test_case_1.txt')
    assert integers_set.include?(-10001)
    assert integers_set.include?(2)
    assert_equal 4, integers_array.length
  end

  def test_case_1
    nb_matching_pairs = compute_multithread('2sum_test_case_1.txt',-10000,10000)
    assert_equal 3, nb_matching_pairs
  end

  def test_case_2
    nb_matching_pairs = compute_multithread('2sum_test_case_2.txt',-10000,10000)
    assert_equal 5, nb_matching_pairs
  end

  #Very long : ~1h25 on a core 2 duo (max 2 threads)
  def test_case_final
    nb_matching_pairs = compute_multithread('2sum.txt',-10000,10000)
    assert_equal 427, nb_matching_pairs
  end

end