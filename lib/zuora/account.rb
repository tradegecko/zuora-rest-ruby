module Zuora
  class Account < Resource
    extend Zuora::RESTOperations::Find
    extend Zuora::RESTOperations::Create
    extend Zuora::RESTOperations::Update

    class << self
      def summary(account_id)

      end
    end
  end
end
