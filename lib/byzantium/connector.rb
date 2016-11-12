require 'socket'
require 'timeout'

module Byzantium
  class Connector
    extend Forwardable

    attr_reader :configuration, :node

    delegate %i(logger max_timeout) => :configuration

    def initialize(configuration, node)
      @configuration = configuration
      @node = node
    end

    def send(payload)
      raw_response = nil

      begin
        Timeout.timeout(max_timeout) do
          socket.puts payload.to_json
          raw_response = socket.gets
        end
      rescue Timeout::Error => error
        log_timeout error
      rescue Errno::ECONNREFUSED => error
        log_connection_refused error
      end

      raw_response
    end

    def socket
      @socket ||= TCPSocket.new node.host, node.port
    end

    def log_timeout(error)
      logger.warn "Request to node (#{node.url}) timed out: #{error}"
    end

    def log_connection_refused(error)
      logger.warn "Node (#{node.url}) refused connection: #{error}"
    end
  end
end
