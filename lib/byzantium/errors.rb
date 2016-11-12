module Byzantium
  module Errors
    Standard        = Class.new StandardError
    RequestTimeout  = Class.new Standard
    UnkownLeader    = Class.new Standard
  end
end
