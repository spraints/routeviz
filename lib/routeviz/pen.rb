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
        route.inject('127.0.0.1') do |last_ip, next_ip|
          last_node = ip_nodes[last_ip]
          next_node = ip_nodes[next_ip]
          graph.add_edge last_node, next_node, :label => route.destination
          next_ip
        end
      end
      graph.output :png => file
    end
  end
end
