module Byzantium
  class Node
    attr_reader :host, :port

    def initialize(host, port)
      @host = host
      @port = port
    end

    def self.from_url(url)
      host, port = url.split ':'
      new(host, port.to_i)
    end
  end
end
