require "rubygems"
require "httparty"
require "active_support/inflector"

require "zuora/version"
require "zuora/http_client"

require "zuora/rest_operations/all"
require "zuora/rest_operations/find"
require "zuora/rest_operations/create"
require "zuora/rest_operations/update"

require "zuora/resource"
require "zuora/account"
require "zuora/catalog/product"

module Zuora
  class << self
    attr_accessor :username, :password, :production_mode, :debug_output

    def base_url
      if production_mode
        "https://api.zuora.com/rest/"
      else
        "https://apisandbox-api.zuora.com/rest/"
      end
    end

    def request(method, url, params={})
      Zuora::HttpClient.public_send(method, url, params.merge(options))
    end

    def options
      {
        basic_auth:   basic_auth,
        debug_output: debug_output
      }
    end

    def basic_auth
      {
        username: username,
        password: password
      }
    end
  end
end
