require 'spec_helper'

describe BacklogApiClient::Client::Space do
  describe '#get_information' do
    before do
      @client = double('client')
      expect(@client).to receive(:get).with('space').and_return('ok')
    end
    subject { described_class.new(@client).get_information }
    it { should eq 'ok' }
  end
end

