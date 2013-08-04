require 'test/unit'
require_relative 'scc'
require_relative 'stack'

class SccTest < Test::Unit::TestCase

  def test_read_file
    v, edges, reversed_edges = read_graph("SCC_test_case_1.txt")
    assert_equal [1,2,3,4,5,6,7,8,9], v
    assert_equal [4], edges[1]
    assert_equal [5,6], edges[8]
    assert_equal 9, edges.keys.length
    assert_equal [4, 9], reversed_edges[7]
  end

  def test_stack
    stack = Stack.new
    stack.push(1)
    stack.push(2)
    assert_equal 2, stack.size
    assert_equal 2, stack.pop
    assert_equal 1, stack.pop
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

  def test_case_4
    max_scc = compute("SCC_test_case_4.txt")
    assert_equal [7,1,0,0,0], max_scc

  end

  def test_case_5
    max_scc = compute("SCC_test_case_5.txt")
    assert_equal [6,3,2,1,0], max_scc
  end

end