require 'test/unit'
require_relative 'dijkstra'

class SccTest < Test::Unit::TestCase

  def test_read_file
    vertices, edges = read_file('dijkstra_test_case_1.txt')
    assert_equal 4, edges.keys.length
    assert_equal [[2,1], [3,4]], edges[1]
    assert_equal [[4,3], [1,4], [2,2]], edges[3]
  end

  def test_case_1
    end_nodes_for_shortest_path = [1,2,3,4]
    shortest_paths = compute('dijkstra_test_case_1.txt', 1, end_nodes_for_shortest_path)
    assert_equal '0,1,3,6', shortest_paths
  end

  def test_case_2
    end_nodes_for_shortest_path = [1,2,3,4,5]
    shortest_paths = compute('dijkstra_test_case_2.txt', 1, end_nodes_for_shortest_path)
    assert_equal '0,10,50,30,60', shortest_paths
  end

  def test_case_3
    end_nodes_for_shortest_path = [5]
    shortest_paths = compute('dijkstra_test_case_3.txt', 13, end_nodes_for_shortest_path)
    assert_equal '26', shortest_paths
  end

  def test_case_exo
    end_nodes_for_shortest_path = [7,37,59,82,99,115,133,165,188,197]
    shortest_paths = compute('dijkstraData.txt', 1, end_nodes_for_shortest_path)
    assert_equal '2599,2610,2947,2052,2367,2399,2029,2442,2505,3068', shortest_paths
  end


end