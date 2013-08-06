require 'test/unit'
require_relative 'dijkstra'

class SccTest < Test::Unit::TestCase

  def test_read_file
    edges = read_file('dijkstra_test_case_1.txt')
    assert_equal 8, edges.length
    assert_equal [1,2,5], edges[0]
    assert_equal [3,1,1], edges[5]
  end

  def test_case_1
    end_nodes_for_shortest_path = [4]
    shortest_paths = compute('dijkstra_test_case_1.txt', 1, end_nodes_for_shortest_path)
    assert_equal 2, shortest_paths[0]
  end

  def test_case_2
    end_nodes_for_shortest_path = [7]
    shortest_paths = compute('dijkstra_test_case_2.txt', 1, end_nodes_for_shortest_path)
    assert_equal 5, shortest_paths[0]
  end

  def test_case_3
    end_nodes_for_shortest_path = [5]
    shortest_paths = compute('dijkstra_test_case_3.txt', 13, end_nodes_for_shortest_path)
    assert_equal 26, shortest_paths[0]
  end

end