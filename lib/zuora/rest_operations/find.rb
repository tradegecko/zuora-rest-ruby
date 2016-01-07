module Zuora
  module RESTOperations
    module Find
      def find(resource_id)
        Zuora.request(:get, find_base_resource_url(resource_id))
      end

    private

      def find_base_resource_url(resource_id)
        [base_resource_url, resource_id].join("/")
      end
    end
  end
end
