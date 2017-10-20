module Zuora
  module ChargeRevenueSummaries
    class SubscriptionCharge < Resource
      class << self
        def find_by_charge_id(charge_id)
          Zuora.request(:get, find_by_charge_id_base_resource_url(charge_id))
        end

        def find_by_charge_id_base_resource_url(charge_id)
          [base_resource_url, charge_id].join("/")
        end
      end
    end
  end
end
