require 'spec_helper'

describe BacklogApiClient::Client::Space do
  let(:client) { double('client') }

  describe '#information' do
    before { expect(@client).to receive(:get).with('space').and_return('ok') }
    subject { described_class.new(@client).information }
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
end
