require 'test/unit'
require_relative 'scc'

class SccTest < Test::Unit::TestCase

  def test_read_file
    v, edges, reversed_edges = read_graph("SCC_test_case_1.txt")
    assert_equal [1,2,3,4,5,6,7,8,9], v
    assert_equal [4], edges[1]
    assert_equal [5,6], edges[8]
    assert_equal 9, edges.keys.length
    assert_equal [4, 9], reversed_edges[7]
  end

  def test_case_1
    max_scc = compute("SCC_test_case_1.txt")
    assert_equal [3,3,3,0,0], max_scc
  end

  def test_case_2
    max_scc = compute("SCC_test_case_2.txt")
    assert_equal [3,3,2,0,0], max_scc
  end

  def test_case_3
    max_scc = compute("SCC_test_case_3.txt")
    assert_equal [3,3,1,1,0], max_scc
  end

  def test_case_final
    max_scc = compute("SCC.txt")
    puts max_scc.to_s
    assert_equal [434821, 968, 459, 313, 211], max_scc
  end

end