#!/usr/bin/env ruby
require 'set'

#returns  "edges : [[end1, length1], [end2, length2]] and an ordered array of vertices
def read_file(file)
  puts "Start read graph"

  edges = {}
  vertices = []

  IO.foreach(file) {|line|

    split_line = line.split(' ')

    start_vertex = split_line[0].to_i
    vertices << start_vertex

    for i in 1..split_line.length-1
      split_el = split_line[i].split(',')

      if edges[start_vertex]
        edges[start_vertex] << ([split_el[0].to_i, split_el[1].to_i])
      else
        edges[start_vertex] = [[split_el[0].to_i, split_el[1].to_i]]
      end

    end
  }

  puts "End read graph"

  return vertices, edges
end

def find_min_dist_in_q(dist, q)
  min = 1000000

  u = nil

  q.each do |vertex|
    if dist[vertex] < min
      min = dist[vertex]
      u = vertex
    end
  end
  u
end

#Implem based on Wikipedia pseudo_code : http://en.wikipedia.org/wiki/Dijkstra's_algorithm
def dijkstra(file, source_node)

  vertices, edges = read_file(file)

  dist = {}

  q = Set.new

  vertices.each do |v|
    dist[v] = 1000000
    q << v
  end

  dist[source_node] = 0

  while not q.empty?

    u = find_min_dist_in_q(dist, q)

    q.delete?(u)

    break if dist[u] == 1000000

    if edges[u]
      edges[u].each do |neighbour_and_dist|
        v = neighbour_and_dist[0]
        dist_u_v = neighbour_and_dist[1]
        greedy_score = dist[u] + dist_u_v
        if greedy_score < dist[v]
          dist[v] = greedy_score
        end
      end
    end

  end

  return dist

end

def compute(file, start_node, end_nodes)

  puts "Start algorithm"
  start = Time.now

  shortest_path_distances = dijkstra(file, start_node)

  required_s_path_distances = []

  end_nodes.each { |end_node|
    required_s_path_distances << shortest_path_distances[end_node]
  }

  puts "runtime: #{Time.now - start}"

  return required_s_path_distances.join(',')

end