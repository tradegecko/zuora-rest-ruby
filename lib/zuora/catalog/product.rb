module Zuora
  module Catalog
    class Product < Resource
      class << self
        def all(params={})
          Zuora.request(:get, base_resource_url, params)["products"]
        end
      end
    end
  end
end
