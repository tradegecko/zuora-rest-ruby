module Zuora
  # returns a preview of what the customer will next be billed
  # acts like any other resource, except is is also considered
  # an action, but not a bulk action like most of the
  # other actions
  class BillingPreview < Resource
    class << self
      def create(account_id:,  auto_renew: "Autorenew",
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

        Zuora.request(:post, action_base_url(:create), {
          body: body.to_json
        })
      end

      def action_base_url(_)
        [resource_endpoint, 'billingPreview'].join("/")
      end

      
      def resource_endpoint
        [Zuora.api_url, "action"].join
      end
    end
  end
end
