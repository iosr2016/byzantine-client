module Byzantium
  class Client
    include Actions

    attr_reader :configuration

    def initialize(options = {})
      @configuration = Configuration.new options
    end

    def configure
      yield configuration
    end

    def perform_request(action_type, params = {})
      Request.new(self, action_type, params).perform
    end

    def distribution
      @distribution ||= initialize_distribution
    end

    def initialize_distribution
      distribution = Distribution.new configuration
      distribution.identify_leader
      distribution
    end
  end
end
