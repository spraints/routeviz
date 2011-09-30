module Routeviz
  class Route < Array
    def initialize destination
      @destination = destination
    end

    attr_reader :destination

    def inspect
      "{route to #{destination}: #{super}"
    end
  end
end
