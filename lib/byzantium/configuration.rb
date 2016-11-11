module Byzantium
  class Configuration
    attr_accessor :urls, :max_timeout

    def initialize(options = {})
      @urls         = options[:urls]        || []
      @max_timeout  = options[:max_timeout] || 5
    end
  end
end
