require 'faraday'

module BacklogV2Client
  class Client
    API_PATH = '/api/v2'

    def initialize(space_name, api_key)
      @api_key = api_key
      @http_cli = Faraday.new(:url => "https://#{space_name}#{API_PATH}")
    end

    def get(resource_path)
      @http_cli.get("#{resource_path}?apiKey=#{@api_key}")
    end

    def post
    end

    def delete
    end

    def space
      BacklogV2Client::Client::Space.new(self)
    end
  end
end
