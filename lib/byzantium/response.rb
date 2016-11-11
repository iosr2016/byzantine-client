module Byzantium
  class Response
    attr_reader :raw_response, :body

    def initialize(raw_response)
      @raw_response = raw_response
    end

    def parse
      @body ||= JSON.parse raw_response, symbolize_names: true
    end
  end
end
