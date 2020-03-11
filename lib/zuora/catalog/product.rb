module Zuora
  module Catalog
    class Product < Resource
      extend Zuora::RESTOperations::All

      class << self
        def fetch(id)
          Zuora.request(:get, object_url(id), error_handler: Zuora::ErrorHandler::StatusChecker)
        end

        def create(params)
          Zuora.request(:post, object_url, body: params.to_json)
        end
      end
    end
  end
end
