module Zuora
  class Refund < Resource
    extend Zuora::RESTOperations::Find
    extend Zuora::RESTOperations::Create
    extend Zuora::RESTOperations::Update

    class << self
      def base_resource_url
        [Zuora.api_url, 'object/refund/'].join
      end
    end
  end
end
