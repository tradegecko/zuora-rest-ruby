module Zuora
  module RESTOperations
    module Delete
      def delete(resource_id)
        Zuora.request(:delete, delete_base_resource_url(resource_id))
      end

      def delete_base_resource_url(resource_id)
        [base_resource_url, resource_id].join("/")
      end
    end
  end
end
