require 'faraday'

module BacklogApiClient
  class Client
    API_PATH = '/api/v2'

    def initialize(space_name, api_key)
      @space_name = space_name
      @api_key = { apiKey: api_key }
      @http_cli = Faraday.new(url: "https://#{space_name}#{API_PATH}")
    end

    def get(resource_path, params = {})
      params.merge!(@api_key)
      @http_cli.get "#{resource_path}#{to_request_params(params)}"
    end

    def post(resource_path, request = {})
      @http_cli.post do |req|
        req.url "#{resource_path}#{to_request_params(@api_key)}"
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        req.body = build_request_body(request)
      end
    end

    def patch(resource_path, request = {})
      @http_cli.patch do |req|
        req.url "#{resource_path}#{to_request_params(@api_key)}"
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        req.body = build_request_body(request)
      end
    end

    def put(resource_path, request = {})
      @http_cli.put do |req|
        req.url "#{resource_path}#{to_request_params(@api_key)}"
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        req.body = build_request_body(request)
      end
    end

    def file_upload(resource_path, file)
      @file_upload_cli ||= file_upload_cli
      payload = { file: Faraday::UploadIO.new(file, 'application/octet-stream') }
      @file_upload_cli.post "#{resource_path}#{to_request_params(@api_key)}", payload
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

    def build_request_body(request_hash)
      request_hash.each_with_object('') do |(k, v), body|
        body << '&' unless body.empty?
        body << "#{k}=#{v}"
      end
    end

    def to_request_params(hash)
      hash.each_with_object('') do |(k, v), request_params|
        request_params << (request_params.empty? ? '?' : '&')
        request_params << "#{k}=#{v}"
      end
    end

    def file_upload_cli
      Faraday.new("https://#{@space_name}#{API_PATH}") do |f|
        f.request :multipart
        f.request :url_encoded
        f.adapter :net_http # This is what ended up making it work
      end
    end
  end
end
