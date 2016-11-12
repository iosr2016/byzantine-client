require 'json'
require 'forwardable'

require 'byzantium/version'
require 'byzantium/errors'
require 'byzantium/utils'
require 'byzantium/configuration'
require 'byzantium/node'
require 'byzantium/connector'
require 'byzantium/distribution'
require 'byzantium/response'
require 'byzantium/request'
require 'byzantium/actions'
require 'byzantium/client'

module Byzantium
  def self.connect(options = {})
    Client.new options
  end
end
