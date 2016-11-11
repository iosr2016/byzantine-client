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

    def distribution
      @distribution ||= Distribution.new configuration.urls
    end
  end
end
