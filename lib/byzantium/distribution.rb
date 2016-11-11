module Byzantium
  class Distribution
    extend Forwardable

    attr_reader :configuration

    delegate urls: :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def send(payload)
      Connector.new(configuration, leader).send payload
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
