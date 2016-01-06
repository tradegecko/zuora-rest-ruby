module Zuora
  class Resource
    include HTTParty

    class << self
      API_VERSION = "v1"

      def base_resource_url
        [Zuora.base_url, resource_endpoint].join
      end

      def resource_endpoint
        _, *namespaces, resource_singular = self.name.underscore.dasherize.split("/")
        [API_VERSION, *namespaces, resource_singular.pluralize].join("/")
      end
    end
  end
end
