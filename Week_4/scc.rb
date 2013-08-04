#!/usr/bin/env ruby

def read_graph(file)

  puts "Start read graph"

  vertices = []
  edges = {}
  reversed_edges = {}

  IO.foreach(file) {|line| split_line = line.split

  left_vertex = split_line[0].to_i
  right_vertex = split_line[1].to_i

  vertices << left_vertex

  if not edges.include?(left_vertex)
    edges[left_vertex] = []
  end

  if not reversed_edges.include?(right_vertex)
    reversed_edges[right_vertex] = []
  end

  edges[left_vertex] << right_vertex
  reversed_edges[right_vertex] << left_vertex

  }

  puts "End read graph"

  return vertices.uniq.sort, edges, reversed_edges
end

def dfs_loop(vertices, edges, nodes_by_finishing_time, leaders)

  #s : see course
  s = nil
  #nodes already explored
  explored_nodes = []

  i = vertices.length - 1
  #nodes = edges.keys
  #i = nodes.length - 1

  while i >= 0
    curr_vertex = vertices[i]
    if not explored_nodes.include?(curr_vertex)
      s = curr_vertex
      dfs(edges, curr_vertex, explored_nodes, nodes_by_finishing_time, s, leaders)
    end
    i = i - 1
  end

  #puts nodes_by_finishing_time.to_s

end

def dfs(edges, current_node, explored_nodes, nodes_by_finishing_time, s, leaders)

  explored_nodes << current_node

  if edges.has_key?(current_node)

    if leaders != nil
      leaders[current_node] = s
    end

    edges[current_node].each { |neighbour|
      if not explored_nodes.include?(neighbour)
        dfs(edges, neighbour, explored_nodes, nodes_by_finishing_time, s, leaders)
      end
    }
  else
    if leaders != nil
      leaders[current_node] = current_node
    end
  end

  if nodes_by_finishing_time != nil
    nodes_by_finishing_time << current_node
  end

end


def compute(file)

  nodes_by_finishing_time = []
  leaders = {}

  puts "Start algorithm"
  start = Time.now

  vertices, edges, reversed_edges = read_graph(file)

  #DFP-Loop on Reverse
  dfs_loop(vertices, reversed_edges, nodes_by_finishing_time, nil)

  #DFS-Loop on Normal graph : need to process nodes in decreasing order of finishing time
  dfs_loop(nodes_by_finishing_time, edges, nil, leaders)

  puts leaders.to_s

  counted_scc = {}
  leaders.values.each { |leader|

    if not counted_scc.include?(leader)
      counted_scc[leader] = 1
    else
      counted_scc[leader] = counted_scc[leader] + 1
    end
  }

  sorted_scc = counted_scc.values.sort { |x, y| y <=> x }

  while sorted_scc.length < 5
    sorted_scc << 0
  end

  puts "runtime: #{Time.now - start}"
  return sorted_scc

end

#max_scc = compute("SCC.txt")
#puts max_scc.to_s
