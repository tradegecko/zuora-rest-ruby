module Zuora
  class Subscription < Resource
    extend Zuora::RESTOperations::Find
    extend Zuora::RESTOperations::Create
    extend Zuora::RESTOperations::Update
    extend Zuora::RESTOperations::Preview

    class << self
      def find_by_account_id(account_id)
        Zuora.request(:get, find_by_account_id_base_resource_url(account_id))
      end

      def find_by_subscription_id(subscription_id)
        Zuora.request(:get, find_by_subscription_id_base_resource_url(subscription_id))
      end

      def renew(subscription_id, body={}, params={})
        Zuora.request(:post, renew_base_resource_url(subscription_id), params.merge({body: body.to_json}))
      end

      def cancel(subscription_id, body={}, params={})
        Zuora.request(:put, cancel_base_resource_url(subscription_id), params.merge({body: body.to_json}))
      end

      def update(subscription_id, body={}, params={})
        Zuora.request(:put, subscriptions_base_resource_url(subscription_id), params.merge({body: body.to_json}))
      end

      def find_by_account_id_base_resource_url(account_id)
        [base_resource_url, "accounts", account_id].join("/")
      end

      def find_by_subscription_id_base_resource_url(subscription_id)
        [base_resource_url, subscription_id].join("/")
      end

      def renew_base_resource_url(subscription_id)
        [base_resource_url, subscription_id, "renew"].join("/")
      end

      def cancel_base_resource_url(subscription_id)
        [base_resource_url, subscription_id, "cancel"].join("/")
      end

      def subscriptions_base_resource_url(subscription_id)
        [base_resource_url, "subscriptions", subscription_id].join("/")
      end
    end
  end
end
