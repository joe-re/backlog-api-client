require 'spec_helper'

describe BacklogApiClient::Client do
  let(:http_cli) { double('http_cli') }
  let(:space_name) { 'test_space_name' }
  let(:api_key) { 'test_api_key' }
  before { expect(Faraday).to receive(:new).with(url: "https://#{space_name}/api/v2").and_return(http_cli) }

  describe '#get' do
    let(:params) { { params: 'test-param' } }
    let(:resource_path) { 'test/resource' }
    before { expect(http_cli).to receive(:get).with("#{resource_path}?#{q(params)}&apiKey=#{api_key}").and_return('ok') }
    subject { described_class.new(space_name, api_key).get(resource_path, params) }
    it { should eq 'ok' }
  end

  describe '#post' do
    let(:params) { { param1: 'test-param1', param2: 'test-param2' } }
    let(:resource_path) { 'test/resource' }
    before do
      request_header = { 'Content-Type' => '' }
      request = double('request', url: 'test-url', headers: request_header)
      expect(request).to receive(:body=).with('param1=test-param1&param2=test-param2')
      expect(http_cli).to receive(:post).and_yield(request).and_return('ok')
    end
    subject { described_class.new(space_name, api_key).post(resource_path, params) }
    it { should eq 'ok' }
  end

  describe '#patch' do
    let(:params) { { param1: 'test-param1', param2: 'test-param2' } }
    let(:resource_path) { 'test/resource' }
    before do
      request_header = { 'Content-Type' => '' }
      request = double('request', url: 'test-url', headers: request_header)
      expect(request).to receive(:body=).with('param1=test-param1&param2=test-param2')
      expect(http_cli).to receive(:patch).and_yield(request).and_return('ok')
    end
    subject { described_class.new(space_name, api_key).patch(resource_path, params) }
    it { should eq 'ok' }
  end

  describe '#put' do
    let(:params) { { param1: 'test-param1', param2: 'test-param2' } }
    let(:resource_path) { 'test/resource' }
    before do
      request_header = { 'Content-Type' => '' }
      request = double('request', url: 'test-url', headers: request_header)
      expect(request).to receive(:body=).with('param1=test-param1&param2=test-param2')
      expect(http_cli).to receive(:put).and_yield(request).and_return('ok')
    end
    subject { described_class.new(space_name, api_key).put(resource_path, params) }
    it { should eq 'ok' }
  end

  describe '#delete' do
    let(:resource_path) { 'test/resource' }
    before { expect(http_cli).to receive(:delete).with("#{resource_path}?apiKey=#{api_key}").and_return('ok') }
    subject { described_class.new(space_name, api_key).delete(resource_path) }
    it { should eq 'ok' }
  end

  def q(hash)
    hash.each_with_object([]) { |(k, v), ary| ary << "#{k}=#{v}" }.join('&')
  end
end
