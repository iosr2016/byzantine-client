require 'logger'

module Byzantium
  class Configuration
    attr_accessor :urls, :max_timeout, :logger

    def initialize(options = {})
      @urls         = options[:urls]        || []
      @max_timeout  = options[:max_timeout] || 5
      @logger       = options[:logger]      || Logger.new(STDOUT)
    end
  end
end
