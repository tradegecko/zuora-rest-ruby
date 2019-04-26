require "zuora/error_handler/status_checker"

module Zuora
  module Transactions
    class Invoice < Resource
      class << self
        def find_by_account_id(account_id, options={})
          Zuora.request(:get, find_by_account_id_base_resource_url(account_id), options)
        end

        def find_by_account_id_base_resource_url(account_id)
          [base_resource_url, "accounts", account_id].join("/")
        end

        def find_by_id(invoice_id)
          Zuora.request(:get, object_url(invoice_id), {error_handler: Zuora::ErrorHandler::StatusChecker})
        end

        def delete(invoice_id)
          Zuora.request(:delete, object_url(invoice_id))
        end
      end
    end
  end
end
