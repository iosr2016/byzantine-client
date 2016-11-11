require 'socket'
require 'timeout'

module Byzantium
  class Connector
    extend Forwardable

    attr_reader :configuration, :node

    delegate max_timeout: :configuration

    def initialize(configuration, node)
      @configuration = configuration
      @node = node
    end

    def send(payload)
      raw_response = nil

      Timeout.timeout(max_timeout) do
        socket.puts payload.to_json
        raw_response = socket.gets
      end

      raw_response
    end

    def socket
      @socket ||= TCPSocket.new node.host, node.port
    end
  end
end
