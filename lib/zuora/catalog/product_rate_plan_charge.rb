module Zuora
  module Catalog
    class ProductRatePlanCharge < Resource
      class << self
        def fetch(id)
          Zuora.request(:get, object_url(id), error_handler: Zuora::ErrorHandler::StatusChecker)
        end

        def create(params)
          Zuora.request(:post, object_url, body: params.to_json)
        end

        def update(params)
          if params.dig(:id).blank?
            raise Zuora::ErrorHandler::ParamError.new('Pass id in params')
          end

          Zuora.request(:put, object_url(params.delete(:id)), body: params.to_json)
        end
      end
    end
  end
end
