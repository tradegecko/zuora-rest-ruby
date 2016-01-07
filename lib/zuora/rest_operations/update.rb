module Zuora
  module RESTOperations
    module Update
      def update(params={})
        Zuora.request(:put, base_resource_url, params)
      end
    end
  end
end
