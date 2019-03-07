require "zuora/error_handler/bulk_action"

module Zuora
  class Action < Resource
    class << self
      [:query, :create].each do |action_name|
        define_method(action_name) do |body|
          Zuora.request(:post, action_base_url(action_name), {body: body.to_json})
        end
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
      end
    end
  end
end
