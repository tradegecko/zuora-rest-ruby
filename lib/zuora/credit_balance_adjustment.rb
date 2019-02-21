module Zuora
  class CreditBalanceAdjustment < Resource
    class << self
      def create(body)
        Zuora.request(:post, object_url, {body: body.to_json})
      end
    end
  end
end
