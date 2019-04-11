module Zuora
  class RatePlanCharge < Resource
    extend Zuora::RESTOperations::Find

    def self.base_resource_url
      [Zuora.api_url, 'object', self.name.underscore.dasherize.split("/")].join
    end
  end
end
