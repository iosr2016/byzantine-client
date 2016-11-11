require 'json'
require 'forwardable'

require 'byzantium/version'
require 'byzantium/configuration'
require 'byzantium/node'
require 'byzantium/response'
require 'byzantium/request'
require 'byzantium/actions'
require 'byzantium/client'

module Byzantium
  def self.connect
    Client.new
  end
end
