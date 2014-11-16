require 'spec_helper'

describe BacklogApiClient::Client::Space do
  let(:client) { double('client') }

  describe '#information' do
    before { expect(client).to receive(:get).with('space').and_return('ok') }
    subject { described_class.new(client).information }
    it { should eq 'ok' }
  end

  describe '#activities' do
    let(:params) { { order: 'ace' } }
    before { expect(client).to receive(:get).with('space/activities', params).and_return('ok') }
    subject { described_class.new(client).activities(params) }
    it { should eq 'ok' }
  end

  describe '#image' do
    before { expect(client).to receive(:get).with('space/image').and_return('ok') }
    subject { described_class.new(client).image }
    it { should eq 'ok' }
  end

  describe '#notification' do
    before { expect(client).to receive(:get).with('space/notification').and_return('ok') }
    subject { described_class.new(client).notification }
    it { should eq 'ok' }
  end

  describe '#update_notification' do
    let(:content) { 'content' }
    before { expect(client).to receive(:put).with('space/notification', content).and_return('ok') }
    subject { described_class.new(client).update_notification(content) }
    it { should eq 'ok' }
  end

  describe '#disk_usage' do
    before { expect(client).to receive(:get).with('space/diskUsage').and_return('ok') }
    subject { described_class.new(client).disk_usage }
    it { should eq 'ok' }
  end

  describe '#attachment' do
    let(:file) { 'test_file' }
    before { expect(client).to receive(:file_upload).with('space/attachment', file).and_return('ok') }
    subject { described_class.new(client).attachment(file) }
    it { should eq 'ok' }
  end
end
