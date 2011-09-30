require 'graphviz'
module Routeviz
  class Pen
    def initialize routes
      @routes = routes
    end

    attr_reader :routes

    def draw file
      graph = GraphViz::new 'traceroute'
      ip_nodes = Hash.new do |h,k|
        h[k] = graph.add_node k, :label => k
      end
      routes.each do |route|
        end_ip = route.inject('127.0.0.1') do |last_ip, next_ip|
          graph.add_edge ip_nodes[last_ip], ip_nodes[next_ip]
          next_ip
        end
        graph.add_edge ip_nodes[end_ip], ip_nodes[route.destination]
      end
      graph.output :png => file
    end
  end
end
