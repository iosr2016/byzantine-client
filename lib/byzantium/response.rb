module Byzantium
  class Response
    attr_reader :raw_responses

    def initialize(raw_responses)
      @raw_responses = Utils.wrap raw_responses
    end

    def body
      @body ||= parse_response_body
    end

    def parse_response_body
      raw_responses.map do |raw_response|
        JSON.parse raw_response, symbolize_names: true
      end
    end
  end
end
