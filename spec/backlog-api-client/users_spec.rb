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

  describe '#create' do
    let(:request) { 'request' }
    before { expect(client).to receive(:post).with('users', request).and_return('ok') }
    subject { described_class.new(client).create(request) }
    it { should eq 'ok' }
  end

  describe '#delete' do
    let(:test_user_id) { 'TEST-USER-ID' }
    before { expect(client).to receive(:delete).with("users/#{test_user_id}").and_return('ok') }
    subject { described_class.new(client).delete(test_user_id) }
    it { should eq 'ok' }
  end

  describe '#myself' do
    before { expect(client).to receive(:get).with('users/myself').and_return('ok') }
    subject { described_class.new(client).myself }
    it { should eq 'ok' }
  end

  describe '#icon' do
    let(:test_user_id) { 'TEST-USER-ID' }
    before { expect(client).to receive(:get).with("users/#{test_user_id}/icon").and_return('ok') }
    subject { described_class.new(client).icon(test_user_id) }
    it { should eq 'ok' }
  end

  describe '#activities' do
    let(:test_user_id) { 'TEST-USER-ID' }
    let(:params) { { order: 'ace' } }
    before { expect(client).to receive(:get).with("users/#{test_user_id}/activities", params).and_return('ok') }
    subject { described_class.new(client).activities(test_user_id, params) }
    it { should eq 'ok' }
  end

  describe '#stars' do
    let(:test_user_id) { 'TEST-USER-ID' }
    let(:params) { { order: 'ace' } }
    before { expect(client).to receive(:get).with("users/#{test_user_id}/stars", params).and_return('ok') }
    subject { described_class.new(client).stars(test_user_id, params) }
    it { should eq 'ok' }
  end
end
