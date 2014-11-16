require 'spec_helper'

describe BacklogApiClient::Client::Users do
  let(:client) { double('client') }

  describe '#list' do
    before { expect(client).to receive(:get).with('users').and_return('ok') }
    subject { described_class.new(client).list }
    it { should eq 'ok' }
  end

end
