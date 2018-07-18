module Zuora
  class PaymentMethod < Resource
    extend Zuora::RESTOperations::Delete
    class << self

      def all_by_account_id(account_id)
        Zuora.request(:get, all_by_account_id_url(account_id), {})
      end

      def all_by_account_id_url(account_id)
        base_resource_url + "/credit-cards/accounts/#{account_id}"
      end
    end
  end
end
