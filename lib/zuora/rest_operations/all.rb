module Zuora
  module RESTOperations
    module All
      def all(params={})
        Zuora.request(:get, base_resource_url, params)
      end
    end
  end
end
