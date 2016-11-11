require 'socket'

module Byzantium
  class Request
    extend Forwardable

    attr_reader :client, :action_type, :params

    delegate leader_instance: :client

    def initialize(client, action_type, params = {})
      @client = client
      @action_type = action_type
      @params = params
    end

    def perform
      socket.puts request_payload.to_json
      response = Response.new socket.gets
      response.parse
    end

    private

    def socket
      @socket ||= TCPSocket.new leader_instance.host, leader_instance.port
    end

    def request_payload
      { type: action_type.to_s }.merge! params
    end
  end
end
