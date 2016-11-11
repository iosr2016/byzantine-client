module Byzantium
  class Request
    extend Forwardable

    attr_reader :client, :action_type, :params

    delegate %i(configuration distribution) => :client

    def initialize(client, action_type, params = {})
      @client = client
      @action_type = action_type
      @params = params
    end

    def perform
      raw_response = distribution.send payload
      Response.new raw_response
    end

    private

    def payload
      { type: action_type.to_s }.merge! params
    end
  end
end
