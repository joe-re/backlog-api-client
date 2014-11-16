require 'faraday'

module BacklogApiClient
  class Client
    API_PATH = '/api/v2'

    def initialize(space_name, api_key)
      @api_key = { apiKey: api_key }
      @http_cli = Faraday.new(url: "https://#{space_name}#{API_PATH}")
    end

    def get(resource_path, params = {})
      params.merge!(@api_key)
      @http_cli.get "#{resource_path}#{to_request_params(params)}"
    end

    def post(resource_path, request_body = {})
      @http_cli.post do |req|
        req.url "#{resource_path}#{to_request_params(@api_key)}"
        req.headers['Content-Type'] = 'application/json'
        req.body = request_body.to_json
      end
    end

    def patch(resource_path, request_body = {})
      @http_cli.patch do |req|
        req.url "#{resource_path}#{to_request_params(@api_key)}"
        req.headers['Content-Type'] = 'application/json'
        req.body = request_body.to_json
      end
    end

    def put(resource_path, request_body = {})
      @http_cli.put do |req|
        req.url "#{resource_path}#{to_request_params(@api_key)}"
        req.headers['Content-Type'] = 'application/json'
        req.body = request_body.to_json
      end
    end

    def delete(resource_path)
      @http_cli.delete "#{resource_path}#{to_request_params(@api_key)}"
    end

    def space
      BacklogApiClient::Client::Space.new(self)
    end

    def issues
      BacklogApiClient::Client::Issues.new(self)
    end

    def users
      BacklogApiClient::Client::Users.new(self)
    end

    private

    def to_request_params(hash)
      hash.each_with_object('') do |(k, v), request_params|
        request_params << (request_params.empty? ? '?' : '&')
        request_params << "#{k}=#{v}"
      end
    end
  end
end
