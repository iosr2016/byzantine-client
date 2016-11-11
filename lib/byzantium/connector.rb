require 'socket'

module Byzantium
  class Connector
    attr_reader :node

    def initialize(node)
      @node = node
    end

    def send(payload)
      socket.puts payload.to_json
      socket.gets
    end

    def socket
      @socket ||= TCPSocket.new node.host, node.port
    end
  end
end
