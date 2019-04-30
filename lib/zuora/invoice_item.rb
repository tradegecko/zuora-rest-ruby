module Zuora
  module Transactions
    class InvoiceItem < Resource
      class << self
        def find_by_invoice_id(invoice_id)
          Zuora.request(:get, [Zuora.api_url, "invoices", invoice_id, "items"].join("/"))
        end
      end
    end
  end
end
