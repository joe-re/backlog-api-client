require 'spec_helper'

describe BacklogApiClient::Client::Issues do
  describe '#get_information' do
    let(:test_issue_id) { 'TEST-ISSUE-ID' }
    before do
      @client = double('client')
      expect(@client).to receive(:get).with("issues/#{test_issue_id}").and_return('ok')
    end
    subject { described_class.new(@client).get_information(test_issue_id) }
    it { should eq 'ok' }
  end
end
