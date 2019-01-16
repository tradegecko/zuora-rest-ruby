module Zuora
  module PaymentMethods
    class CreditCard < Resource
      extend Zuora::RESTOperations::Update

      class << self
        def all_by_account_id(account_id)
          Zuora.request(:get, all_by_account_id_url(account_id), {})
        end

        def all_by_account_id_url(account_id)
          base_resource_url + "/accounts/#{account_id}"
        end
      end
    end
  end
end
