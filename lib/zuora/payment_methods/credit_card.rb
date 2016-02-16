module Zuora
  module PaymentMethods
    class CreditCard < Resource
      extend Zuora::RESTOperations::Create
      extend Zuora::RESTOperations::Update

      class << self
        def find_by_account_id(account_id)
          Zuora.request(:get, find_by_account_id_base_resource_url(account_id))
        end

        def find_by_account_id_base_resource_url(account_id)
          [base_resource_url, "accounts", account_id].join("/")
        end
      end
    end
  end
end
