module Zuora
  module ErrorHandler
    class BulkCreate < BulkAction
      def self.handle_response(response)
        return generate_action_responses(response)
      end
    end
  end
end
