module Zuora
  class Action < Resource
    class << self
      [:query, :create, :amend].each do |action_name|
        define_method(action_name) do |body|
          Zuora.request(:post, action_base_url(action_name), {body: body.to_json})
        end
      end

      def action_base_url(action_name)
        [resource_endpoint, action_name].join("/")
      end

      def resource_endpoint
        [Zuora.base_url, "action"].join
      end
    end
  end
end
