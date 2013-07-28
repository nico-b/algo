#!/usr/bin/env ruby

def read_graph(file)

  vertices = []
  edges = []

  IO.foreach(file) {|line| split_line = line.split
    top_vertex = split_line[0]
    vertices << top_vertex
    split_line[1..split_line.length - 1].each { |curr_vertex|
      new_edge = [top_vertex, curr_vertex]
      #doublons filter
      if not edges.include?(new_edge.reverse)
        edges << new_edge
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
  edges_length = edges.length

  if remaining_vertices <= 2
    return edges_length
  end

  rand_index = rand(edges_length - 1)
  random_edge = edges[rand_index]
  start_vertex = random_edge[0]
  end_vertex = random_edge[1]

  #pattern : each time, end_vertex is replaced by start_vertex
  edges.each { |edge|
    if edge[0] == end_vertex
      edge[0] = start_vertex
    end
    if edge[1] == end_vertex
      edge[1] = start_vertex
    end
  }

  #delete inner loops
  edges.delete_if {|e| e[0] == e[1]}

  vertices.delete(end_vertex)

  return random_contraction(edges, vertices)

end