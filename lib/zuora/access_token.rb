# frozen_string_literal: true

module Zuora
  class AccessToken
    include HTTParty
    
    headers 'Content-Type' => 'application/x-www-form-urlencoded'
    headers 'User-Agent' => "zuora-rest/#{Zuora::VERSION}"

    class << self
      def generate
        response = HTTParty.post(oauth_token_url, body: request_body)
        raise Zuora::ErrorHandler::APIError, response unless response.code == 200

        response['access_token']
      end

    private

      def request_body
        {
          'client_id' => ENV['ZUORA_CLIENT_ID'],
          'client_secret' => ENV['ZUORA_CLIENT_SECRET'],
          'grant_type' => 'client_credentials'
        }
      end

      def oauth_token_url
        "#{Zuora.base_url}/oauth/token"
      end
    end
  end
end
