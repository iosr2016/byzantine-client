module Byzantium
  class Distribution
    attr_reader :urls

    def initialize(urls)
      @urls = urls
    end

    def send(payload)
      Connector.new(leader).send payload
    end

    def leader
      @leader ||= nodes.sample
    end

    def nodes
      @nodes ||= build_nodes
    end

    private

    def build_nodes
      urls.map { |url| Node.from_url url }
    end
  end
end
