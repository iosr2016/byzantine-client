module Byzantium
  module Actions
    def get(key)
      perform_request :get, key: key
    end

    def set(key, value)
      perform_request :set, key: key, value: value
    end
  end
end
