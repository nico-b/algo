#!/usr/bin/env ruby

def read_graph(file)

  vertices = []
  edges = []

  IO.foreach(file) {|line| split_line = line.split
    top_vertex = split_line[0]
    vertices << top_vertex
    split_line[1..split_line.length - 1].each { |curr_vertex|
      new_edge = [top_vertex, curr_vertex]
      if not edges.include?(new_edge.reverse)
        edges << [top_vertex, curr_vertex]
      end
    }
  }

  return vertices, edges
end

def process(file, nb_it)

  puts "Nb iterations = #{nb_it}"

  min_cut = 0

  v, e = read_graph(file)
  v_dump = Marshal.dump(v)
  e_dump = Marshal.dump(e)

  for i in 1..nb_it

    vertices = Marshal.load(v_dump)
    edges = Marshal.load(e_dump)

    res = random_contraction(edges, vertices)

    puts "iteration #{i} : res = #{res}"

    if min_cut == 0 or res < min_cut
      min_cut = res
    end
  end

  puts "Min cut = #{min_cut}"
  return min_cut

end

def random_contraction(edges, vertices)

  remaining_vertices = vertices.length

  if remaining_vertices <= 2
    return edges.length
  end

  rand_index = rand(edges.length - 1)
  random_edge = edges[rand_index]
  start_vertex = random_edge[0]
  end_vertex = random_edge[1]

  new_edges = []

  edges.map { |edge|
    if edge[0] == end_vertex or edge[0] == start_vertex
      if edge[1] != end_vertex and edge[1] != start_vertex
        new_edges << [start_vertex, edge[1]]
      end
    elsif edge[1] == end_vertex or edge[1] == start_vertex
      if edge[0] != end_vertex and edge[0] != start_vertex
        new_edges << [edge[0], start_vertex]
      end
    else
      new_edges << edge
    end
  }

  vertices.delete(end_vertex)

  return random_contraction(new_edges, vertices)

end