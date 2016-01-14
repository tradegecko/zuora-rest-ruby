module Zuora
  class RSASignature < Resource
    class << self
      def fetch(page_id, params={})
        Zuora.request(:post, base_resource_url, params.merge(body: {
          uri: Zuora.payment_page_url,
          method: "POST",
          pageId: page_id
        }.to_json))
      end
    end
  end
end
