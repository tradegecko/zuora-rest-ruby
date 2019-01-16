module Zuora
  class BillingPreview < Action
    extend Zuora::RESTOperations::Create

    def self.create(account_id:,  auto_renew: "Autorenew",
              target_date: Date.tomorrow,
              include_evergreen_subscriptions: true)
      body = {
        "requests" => [{
        "AssumeRenewal" => auto_renew,
        "AccountId" => account_id,
        "TargetDate" => target_date.strftime("%Y-%m-%d"),
        "IncludingEvergreenSubscription" => include_evergreen_subscriptions
        }]
      }
      super(body)
    end
  end
end
