require "zuora/error_handler/bulk_action"
require "zuora/error_handler/bulk_create"

module Zuora
  class Action < Resource
    class << self
      def create(body)
        Zuora.request(:post, action_base_url(:create), {
          body: body.to_json,
          error_handler: Zuora::ErrorHandler::BulkCreate
        })
      end

      def query(body)
        Zuora.request(:post, action_base_url(:query), {
          body: body.to_json,
          error_handler: Zuora::ErrorHandler::BulkAction
        })
      end

      def amend(body)
        Zuora.request(:post, action_base_url(:amend), {
          body: body.to_json,
          error_handler: Zuora::ErrorHandler::BulkAction
        })
      end

      def action_base_url(action_name)
        [resource_endpoint, action_name].join("/")
      end

      def resource_endpoint
        [Zuora.api_url, "action"].join
        # The below is from our gem.
        # TODO: Is the above for a later version of the api
        # _, *namespaces, action_name = self.name.underscore.split("/")
        # [API_VERSION, *namespaces, "action", action_name.camelize(:lower)].join("/")
      end
    end
  end
end
