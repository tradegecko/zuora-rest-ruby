module Zuora
  module RESTOperations
    module Create
      def create(params={})
        Zuora.request(:post, base_resource_url, params)
      end
    end
  end
end
