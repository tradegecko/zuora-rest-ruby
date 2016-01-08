module Zuora
  class Account < Resource
    extend Zuora::RESTOperations::Find
    extend Zuora::RESTOperations::Create
    extend Zuora::RESTOperations::Update

    class << self
      def summary(account_id)
        Zuora.request(:get, summary_base_resource_url(account_id))
      end

      def summary_base_resource_url(account_id)
        [base_resource_url, account_id, "summary"].join("/")
      end
    end
  end
end
