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

    def perform_request(receiver, type, params = {})
      logger.progname = SecureRandom.hex 4

      logger.info "Request #{type} #{params}"

      response = Request.new(self, receiver, type, params).perform
      logger.info "Response #{response.body}"

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
