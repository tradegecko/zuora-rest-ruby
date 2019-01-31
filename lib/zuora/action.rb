module Zuora
  class Action
    include HTTParty

    class << self
      def query(query_string)
        Zuora.request(:post, action_base_url + 'query', {body: {queryString: query_string}.to_json})
      end

      def create(body={}, params={})
        raise Zuora::APIError.new({error: 'Please provide objects and type'}) unless body.key?(:objects) && body.key?(:type)

        Zuora.request(:post, action_base_url + 'create', {body: {objects: body[:objects], type: body[:type]}.to_json})
      end

      def action_base_url
        Zuora.base_url + 'action/'
      end
    end
  end
end
