module Zuora
  module ErrorHandler
    class StatusChecker
      def self.handle_response(response)
        return response.except("Body") if response.code == 200

        case response.code
        when 200...299
          return response.except("Body")
        when 404
          raise Zuora::ErrorHandler::NotFound.new(response)
        when 400
          raise Zuora::ErrorHandler::BadRequest.new(response)
        else
          raise Zuora::ErrorHandler::UnknownError.new(response)
        end
      end
    end
  end
end
