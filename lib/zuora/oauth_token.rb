module Zuora
  class OauthToken < Resource
    include HTTParty
    headers "Content-Type" => "application/x-www-form-urlencoded"
    debug_output $stdout

    class << self
      def create(params)
        self.post("https://rest.zuora.com/oauth/token", body: params)
      end

      def resource_endpoint
        [API_VERSION, 'oauth/token'].join("/")
      end
    end
  end
end