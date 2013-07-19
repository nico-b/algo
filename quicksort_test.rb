require 'test/unit'
require_relative 'quicksort'

class QuickSortTest < Test::Unit::TestCase

  def test_find_median_index_odd
    assert_equal 2, find_median_index([2,1,4,3,7], 0)
  end

  def test_find_median_index_even
    assert_equal 0, find_median_index([5,1,2,3,7,8], 0)
  end

end