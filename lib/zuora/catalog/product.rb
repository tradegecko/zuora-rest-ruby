module Zuora
  module Catalog
    class Product < Resource
      extend Zuora::RESTOperations::All
    end
  end
end
