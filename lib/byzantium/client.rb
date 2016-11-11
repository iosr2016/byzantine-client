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
      @distribution ||= Distribution.new configuration
    end
  end
end
