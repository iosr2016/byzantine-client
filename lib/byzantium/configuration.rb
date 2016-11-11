module Byzantium
  class Configuration
    attr_accessor :urls, :max_timeout

    def initialize
      @urls = []
      @max_timeout = 5
    end
  end
end
