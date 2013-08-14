require 'test/unit'
require_relative 'median_maintenance'

class MedianMaintenanceTest < Test::Unit::TestCase

  def test_read_file
    int_stream = read_file('Median.txt')
    assert_equal 225, int_stream[4]
    assert_equal 4292, int_stream[10]
  end

  def test_compute_median_maintenance_case1
      assert_equal(50, compute("median_test_1.txt"))
  end

  def test_compute_median_maintenance_case2
    assert_equal(8046, compute("median_test_2.txt"))
  end

  def test_compute_median_maintenance_final
    assert_equal(1213, compute("Median.txt"))
  end

end