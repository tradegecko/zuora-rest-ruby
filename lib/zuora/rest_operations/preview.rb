module Zuora
  module RESTOperations
    module Preview
      def preview(body={}, params={})
        Zuora.request(:post, preview_base_resource_url, params.merge({body: body.to_json}))
      end

      def preview_base_resource_url
        [base_resource_url, "preview"].join("/")
      end
    end
  end
end
