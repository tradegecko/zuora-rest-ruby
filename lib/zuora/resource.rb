module Zuora
  class Resource
    include HTTParty

    class << self
      def base_resource_url
        [Zuora.base_url, resource_endpoint].join
      end

      def resource_endpoint
        _, *namespaces, resource_singular = self.name.underscore.dasherize.split("/")
        [*namespaces, resource_singular.pluralize].join("/")
      end

      def object_url(model_id=nil)
        _, *namespaces, resource_singular = self.name.underscore.dasherize.split("/")
        segments = ['object', resource_singular]
        segments << model_id if model_id
        [Zuora.base_url, segments.join('/')].join
      end
    end
  end
end
