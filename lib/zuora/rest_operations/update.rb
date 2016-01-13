module Zuora
  module RESTOperations
    module Update
      def update(resource_id, body={}, params={})
        Zuora.request(:put, update_base_resource_url(resource_id), params.merge({body: body.to_json}))
      end

      def update_base_resource_url(resource_id)
        [base_resource_url, resource_id].join("/")
      end
    end
  end
end
