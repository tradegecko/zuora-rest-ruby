require "rubygems"
require "httparty"
require "active_support/inflector"
require "active_support/core_ext/hash/keys"
require "active_support/core_ext/date/calculations"

require "zuora/version"
require "zuora/http_client"
require "zuora/error_handler"

require "zuora/rest_operations/all"
require "zuora/rest_operations/find"
require "zuora/rest_operations/create"
require "zuora/rest_operations/update"
require "zuora/rest_operations/delete"
require "zuora/rest_operations/preview"

require "zuora/resource"
require "zuora/action"
require "zuora/account"
require "zuora/billing_preview_run"
require "zuora/billing_preview"
require "zuora/billing_document"
require "zuora/file"
require "zuora/invoice"
require "zuora/subscription"
require "zuora/payment"
require "zuora/payment_method"
require "zuora/payment_methods/credit_card"
require "zuora/catalog/product"
require "zuora/charge_revenue_summaries/subscription_charge"
require "zuora/rsa_signature"
require "zuora/oauth_token"

module Zuora
  class << self
    attr_accessor :production_mode, :debug_output, :client_id, :client_secret, :results_as_hash

    def base_url
      if production_mode
        "https://rest.zuora.com/"
      else
        "https://rest.apisandbox.zuora.com/"
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
      attempts ||= 0
      Zuora::HttpClient.set_authorization_header
      response = Zuora::HttpClient.public_send(method, url, params.merge(options))
      Zuora::ErrorHandler.handle_response(response)
    rescue Zuora::APIError, Zuora::UnknownError => e
      if e.message.match("Error 90000011") || e.message.match("Authentication error")
        #"Error 90000011: This resource is protected, please sign in first"
        # since zuora does not believe we have rights to get information from it
        # likely the bearer token has expired. So let's get a new one and
        # set it in the header
        Zuora::HttpClient.replace_bearer_token
        Zuora::HttpClient.set_authorization_header
        sleep 1
        if (attempts += 1) <= 2
          retry
        else
          raise
        end
      else
        raise # since it was  not the protected resource error, we want to re-raise because it could be that Zuora is down
      end
    end

    def options
      {
        debug_output: debug_output
      }
    end
  end
end
