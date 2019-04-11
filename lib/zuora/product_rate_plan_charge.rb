module Zuora
  class ProductRatePlanCharge < Resource
    extend Zuora::RESTOperations::Find

    def self.base_resource_url
      [Zuora.api_url, 'object/product-rate-plan'].join
    end
  end
end
