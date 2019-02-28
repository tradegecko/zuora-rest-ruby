module Zuora
  module ErrorHandler
    class BulkAction
      def self.handle_response(response)
        return generate_action_responses(response["results"]) if response["results"]

        if response["message"]
          raise Zuora::ErrorHandler::APIError.new(response["message"])
        else
          raise Zuora::ErrorHandler::UnknownError.new(response)
        end
      end

      def self.generate_action_responses(response_array)
        response_array.map do |response_hash|
          ActionResponse.new(response_hash)
        end
      end

      class ActionResponse
        def initialize(response_hash)
          @response_hash = response_hash
        end

        def success?
          @response_hash["Success"]
        end

        def body
          @response_hash.except("Success")
        end

        def errors
          @response_hash["Errors"]
        end
      end
    end
  end
end
