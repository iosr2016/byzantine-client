module Byzantium
  class Client
    include Actions

    attr_reader :configuration

    def initialize
      @configuration = Configuration.new
    end

    def configure
      yield configuration
    end

    def perform_request(action_type, params = {})
      Request.new(self, action_type, params).perform
    end

    def leader_instance
      @leader_instance ||= store_instances.first
    end

    def store_instances
      @store_instances ||= build_store_instances
    end

    def build_store_instances
      configuration.urls.map { |url| Node.from_url url }
    end
  end
end
