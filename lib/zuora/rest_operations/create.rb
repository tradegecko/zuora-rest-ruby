module Zuora
  module RESTOperations
    module Create
      def create(body={}, params={})
        Zuora.request(:post, base_resource_url, params.merge({body: body.to_json}))
      end
    end
  end
end
