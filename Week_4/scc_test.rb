require 'test/unit'
require_relative 'scc'

class SccTest < Test::Unit::TestCase

  def test_case_1

    assert_equal [3,3,3,0,0], max_scc

  end

  def test_case_2

    assert_equal [3,3,2,0,0], max_scc

  end

  def test_case_3

    assert_equal [3,3,1,1,0], max_scc

  end

  def test_case_4

    assert_equal [7,1,0,0,0], max_scc

  end

  def test_case_5

    assert_equal [6,3,2,1,0], max_scc

  end

end