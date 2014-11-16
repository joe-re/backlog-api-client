require 'spec_helper'

describe BacklogApiClient::Client::Users do
  let(:client) { double('client') }

  describe '#list' do
    before { expect(client).to receive(:get).with('users').and_return('ok') }
    subject { described_class.new(client).list }
    it { should eq 'ok' }
  end

  describe '#information' do
    let(:test_user_id) { 'TEST-USER-ID' }
    before { expect(client).to receive(:get).with("users/#{test_user_id}").and_return('ok') }
    subject { described_class.new(client).information(test_user_id) }
    it { should eq 'ok' }
  end
end
