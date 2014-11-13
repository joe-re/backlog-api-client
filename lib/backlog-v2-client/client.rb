require 'faraday'

module BacklogV2Client
  class Client
    def initialize(space_name, api_key)
      @space_name = space_name
      @api_key = api_key
    end
  end
end
