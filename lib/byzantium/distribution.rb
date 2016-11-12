module Byzantium
  class Distribution
    extend Forwardable

    attr_reader :configuration

    delegate urls: :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def identify_leader
      raise_unknown_leader unless leader
    end

    def send_to_all(payload)
      nodes.map { |node| send_to_node(node, payload) }.compact
    end

    def send_to_leader(payload)
      send_to_node leader, payload
    end

    def send_to_node(node, payload)
      Connector.new(configuration, node).send payload
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

    def raise_unknown_leader
      error_message = "Unable to identify leader from provided list of urls: #{urls}"
      raise Errors::UnkownLeader, error_message
    end
  end
end
