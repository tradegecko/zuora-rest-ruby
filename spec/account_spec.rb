require 'spec_helper'

describe Zuora::Account, type: :request do
  it_behaves_like 'find' do
    let(:resource_id) { 'TESTRUN-3-24495' }
    let(:successful_find_response) do
      {"basicInfo"=>{"id"=>nil,"name"=>nil,"accountNumber"=>nil,"notes"=>nil,"status"=>nil,"crmId"=>nil,"batch"=>nil,"invoiceTemplateId"=>nil,"communicationProfileId"=>nil,"invoice_entity__c"=>nil,"Stripe_AccountId__c"=>nil,"PinPay_TokenId__c"=>nil,"Entity__c"=>nil,"salesRep"=>nil,"parentId"=>nil},"billingAndPayment"=>{"billCycleDay"=>nil,"currency"=>nil,"paymentTerm"=>nil,"paymentGateway"=>nil,"invoiceDeliveryPrefsPrint"=>nil,"invoiceDeliveryPrefsEmail"=>nil,"additionalEmailAddresses"=>nil},"metrics"=>{"balance"=>nil,"totalInvoiceBalance"=>nil,"creditBalance"=>nil,"contractedMrr"=>nil},"billToContact"=>{"address1"=>nil,"address2"=>nil,"city"=>nil,"country"=>nil,"county"=>nil,"fax"=>nil,"firstName"=>nil,"homePhone"=>nil,"lastName"=>nil,"mobilePhone"=>nil,"nickname"=>nil,"otherPhone"=>nil,"otherPhoneType"=>nil,"personalEmail"=>nil,"state"=>nil,"taxRegion"=>nil,"workEmail"=>nil,"workPhone"=>nil,"zipCode"=>nil,"contactDescription"=>nil},"soldToContact"=>{"address1"=>nil,"address2"=>nil,"city"=>nil,"country"=>nil,"county"=>nil,"fax"=>nil,"firstName"=>nil,"homePhone"=>nil,"lastName"=>nil,"mobilePhone"=>nil,"nickname"=>nil,"otherPhone"=>nil,"otherPhoneType"=>nil,"personalEmail"=>nil,"state"=>nil,"taxRegion"=>nil,"workEmail"=>nil,"workPhone"=>nil,"zipCode"=>nil,"contactDescription"=>nil},"taxInfo"=>nil}
    end
  end
end
