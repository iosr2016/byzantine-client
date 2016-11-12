require 'securerandom'

module Byzantium
  class Client
    extend  Forwardable
    include Actions

    attr_reader :configuration

    delegate logger: :configuration

    def initialize(options = {})
      @configuration = Configuration.new options
    end

    def configure
      yield configuration
    end

    def perform_request(action_type, params = {})
      logger.progname = SecureRandom.hex 4

      logger.info "#{action_type} #{params}"

      response = Request.new(self, action_type, params).perform
      logger.info response.body

      response
    rescue => error
      logger.error error.to_s
      raise error
    end

    def distribution
      @distribution ||= initialize_distribution
    end

    private

    def initialize_distribution
      distribution = Distribution.new configuration
      distribution.identify_leader
      distribution
    end
  end
end
