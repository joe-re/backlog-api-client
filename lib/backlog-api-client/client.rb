require 'faraday'

module BacklogApiClient
  class Client
    API_PATH = '/api/v2'

    def initialize(space_name, api_key)
      @api_key = api_key
      @http_cli = Faraday.new(url: "https://#{space_name}#{API_PATH}")
    end

    def get(resource_path)
      @http_cli.get "#{resource_path}?apiKey=#{@api_key}"
    end

    def post(resource_path, request = '')
      @http_cli.post do |req|
        req.url "#{resource_path}?apiKey=#{@api_key}"
        req.headers['Content-Type'] = 'application/json'
        req.body = request
      end
    end

    def delete
    end

    def space
      BacklogApiClient::Client::Space.new(self)
    end

    def issues
      BacklogApiClient::Client::Issues.new(self)
    end
  end
end
