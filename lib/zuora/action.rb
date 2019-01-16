module Zuora
  class Action < Resource
    class << self
      def resource_endpoint
        _, *namespaces, action_name = self.name.underscore.split("/")
        [API_VERSION, *namespaces, "action", action_name.camelize(:lower)].join("/")
      end
    end
  end
end
