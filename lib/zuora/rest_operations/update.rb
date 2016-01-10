module Zuora
  module RESTOperations
    module Update
      def update(body={}, params={})
        Zuora.request(:put, base_resource_url, params.merge({body: body.to_json}))
      end
    end
  end
end
