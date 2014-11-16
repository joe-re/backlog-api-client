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
    # ToDo: write test
  end

  describe '#patch' do
    # ToDo: write test
  end

  def q(hash)
    hash.each_with_object([]) { |(k, v), ary| ary << "#{k}=#{v}" }.join('&')
  end
end
