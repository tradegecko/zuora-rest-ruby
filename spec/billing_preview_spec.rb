require 'spec_helper'

RSpec.describe Zuora::BillingPreview do
  before do
    stub_zuora_request(action: :post, end_point: "oauth/token",
                        response_body: '{"access_token":"___access_token___"}',
                        headers: { 'Content-Type'=>'application/x-www-form-urlencoded' },
                        exclude_version: true)
    stub_zuora_request(action: :post,
                      end_point: "action/billingPreview",
                      response_body: response)
  end

  let(:account_id) { '12345' }

  subject { described_class.create(account_id: account_id) }

  context 'when the request is successful' do
    let(:response) {  zuora_preview_billing_response_successful(account_id: account_id).to_json }

    it 'should return the account id associated with the request' do
      expect(subject.account_id).to eq(account_id)
    end

    it 'should have the number of invoice items indicated in the size' do
      expect(subject.invoice_item.length).to eq(subject.size)
    end

    it 'and invoice item should return a charge amount' do
      expect(subject.invoice_item.first.charge_amount).to eq(109)
    end
  end

  context 'when the request is not successful' do
    let(:response) {  zuora_preview_billing_response_failure(account_id: account_id).to_json }

    it 'should raise an APIError and return the code and message' do
      expect { subject }.to raise_error(Zuora::APIError, "Error REQUEST_REJECTED: The account must be an active account.")
    end
  end
end