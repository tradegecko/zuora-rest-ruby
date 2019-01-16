module Zuora
  class OauthToken < Resource
    include HTTParty
    headers "Content-Type" => "application/x-www-form-urlencoded"
    debug_output $stdout

    class << self
      def create(params)
        self.post(base_resource_url, body: params)
      end

      def resource_endpoint
        "oauth/token"
      end
    end
  end
end