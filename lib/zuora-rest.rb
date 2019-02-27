require "rubygems"
require "httparty"
require "active_support/inflector"

require "zuora/version"
require "zuora/http_client"
require "zuora/error_handler/base"

require "zuora/rest_operations/all"
require "zuora/rest_operations/find"
require "zuora/rest_operations/create"
require "zuora/rest_operations/update"
require "zuora/rest_operations/delete"
require "zuora/rest_operations/preview"

require "zuora/resource"
require "zuora/action"
require "zuora/account"
require "zuora/credit_balance_adjustment"
require "zuora/invoice"
require "zuora/subscription"
require "zuora/payment"
require "zuora/payment_run"
require "zuora/payment_method"
require "zuora/payment_methods/credit_card"
require "zuora/catalog/product"
require "zuora/charge_revenue_summaries/subscription_charge"
require "zuora/rsa_signature"

module Zuora
  class << self
    attr_accessor :username, :password, :production_mode, :debug_output

    def base_url
      if production_mode
        "https://rest.zuora.com/v1/"
      else
        "https://rest.apisandbox.zuora.com/v1/"
      end
    end

    def payment_page_url
      if production_mode
        "https://www.zuora.com/apps/PublicHostedPageLite.do"
      else
        "https://apisandbox.zuora.com/apps/PublicHostedPageLite.do"
      end
    end

    def request(method, url, params={})
      response = Zuora::HttpClient.public_send(method, url, params.merge(options))
      error_handler = pick_error_handler(params)
      error_handler.handle_response(response)
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

  private

    def pick_error_handler(params)
      if params[:error_handler]
        params[:error_handler]
      else
        Zuora::ErrorHandler::Base
      end
    end
  end
end
