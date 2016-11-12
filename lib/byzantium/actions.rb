module Byzantium
  module Actions
    def get(key)
      perform_request :all, :get, key: key
    end

    def set(key, value)
      perform_request :leader, :set, key: key, value: value
    end
  end
end
