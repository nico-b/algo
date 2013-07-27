require 'test/unit'
require_relative 'karger_min_cut'

class KargerMinCutTest < Test::Unit::TestCase

  def test_with_4_nodes_graph

    min_cut = process("fourNodesCut.txt", 10)
    assert_equal 2, min_cut

  end

  def test_with_test_set
    start = Time.now
    min_cut = process("kargerMinCut.txt", 100)
    puts "runtime: #{Time.now - start}"

    assert_equal 17, min_cut
  end


end