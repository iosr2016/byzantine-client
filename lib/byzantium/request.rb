module Byzantium
  class Request
    extend Forwardable

    attr_reader :client, :receiver, :type, :params

    delegate %i(configuration distribution) => :client

    def initialize(client, receiver, type, params = {})
      @client = client
      @receiver = receiver
      @type = type
      @params = params
    end

    def perform
      Response.new raw_response
    end

    private

    def raw_response
      distribution.send "send_to_#{receiver}", payload
    end

    def payload
      { type: type.to_s }.merge! params
    end
  end
end
