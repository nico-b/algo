require 'test/unit'
require_relative 'divide_and_conquer_inversion'

class DivideAndConquerInversionTest < Test::Unit::TestCase

  def test_8_integers_inversion

    sample_array = [54044, 14108, 79294, 29649, 25260, 60660, 2995, 53777]

    total_inv, sorted_array = count_inversions(sample_array)

    assert_equal 16, total_inv
  end

  def test_9_integers_inversion

    sample_array = [54044, 14108, 79294, 29649, 25260, 60660, 2995, 53777, 99999]

    total_inv, sorted_array = count_inversions(sample_array)

    assert_equal 16, total_inv
  end


end