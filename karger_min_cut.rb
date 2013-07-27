#!/usr/bin/env ruby

def read_graph(file)

  vertices = []
  edges = []

  IO.foreach(file) {|line| split_line = line.split
    top_vertex = split_line[0]
    vertices << top_vertex
    split_line[1..split_line.length - 1].each { |curr_vertex|
      edges << [top_vertex, curr_vertex]
    }
  }

  return vertices, edges
end


def process(file, nb_it)

  if nb_it == nil
    nb_iterations = 1000
  else
    nb_iterations = nb_it
  end

  puts "Nb iterations = #{nb_iterations}"

  min_cut = 0

  for i in 1..nb_iterations

    vertices, edges = read_graph(file)
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
    #edges double way --> size must be divided by 2
    return edges.length / 2
  end

  rand_index = rand(edges.length - 1)
  random_edge = edges[rand_index]
  start_vertex = random_edge[0]
  end_vertex = random_edge[1]

  new_edges = []

  for i in 0..edges.length-1
    if edges[i][0] == end_vertex or edges[i][0] == start_vertex
      if edges[i][1] != end_vertex and edges[i][1] != start_vertex
        new_edges << [start_vertex, edges[i][1]]
      end
    elsif edges[i][1] == end_vertex or edges[i][1] == start_vertex
      if edges[i][0] != end_vertex and edges[i][0] != start_vertex
        new_edges << [edges[i][0], start_vertex]
      end
    else
      new_edges << edges[i]
    end
  end

  vertices.delete(end_vertex)

  return random_contraction(new_edges, vertices)

end