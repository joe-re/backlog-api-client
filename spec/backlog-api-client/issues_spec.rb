require 'spec_helper'

describe BacklogApiClient::Client::Issues do
  let(:client) { double('client') }

  describe '#list' do
    let(:params) { { projectId: 'test-project' } }
    before { expect(client).to receive(:get).with('issues', params).and_return('ok') }
    subject { described_class.new(client).list(params) }
    it { should eq 'ok' }
  end

  describe '#information' do
    let(:test_issue_id) { 'TEST-ISSUE-ID' }
    before { expect(client).to receive(:get).with("issues/#{test_issue_id}").and_return('ok') }
    subject { described_class.new(client).information(test_issue_id) }
    it { should eq 'ok' }
  end

  describe '#create' do
    let(:request) { 'request' }
    before { expect(client).to receive(:post).with('issues', request).and_return('ok') }
    subject { described_class.new(client).create(request) }
    it { should eq 'ok' }
  end

  describe '#update' do
    let(:test_issue_id) { 'TEST-ISSUE-ID' }
    let(:request) { 'request' }
    before { expect(client).to receive(:patch).with("issues/#{test_issue_id}", request).and_return('ok') }
    subject { described_class.new(client).update(test_issue_id, request) }
    it { should eq 'ok' }
  end
end
