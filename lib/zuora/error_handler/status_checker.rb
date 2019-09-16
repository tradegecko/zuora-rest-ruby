module Zuora
  module ErrorHandler
    class StatusChecker
      def self.handle_response(response)
        case response.code
        when 200...299
          return response
        else
          raise Zuora::ClientError, (response.code, response)
        end
      end
    end
  end
end
