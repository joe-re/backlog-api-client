require 'spec_helper'

describe BacklogApiClient::Client::Projects do
  let(:client) { double('client') }

  describe described_class::CustomFields do
    let(:parent_resource_name) { 'projects' }
    describe '#list' do
      let(:project_id) { 1 }
      before { expect(client).to receive(:get).with("#{parent_resource_name}/#{project_id}/customFields").and_return('ok') }
      subject { described_class.new(client, parent_resource_name).list(project_id) }
      it { should eq 'ok' }
    end
  end
end
