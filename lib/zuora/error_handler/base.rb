module Zuora
  module ErrorHandler
    class Base
      API_SUCCESS_KEYS = ['success', 'Success', 'done', 'Done'].freeze

      def self.handle_response(response)
        success_key = API_SUCCESS_KEYS.select { |key| response.key?(key) }.first
        return response.except(success_key) if success_key && response[success_key]

        if response.key?('results')
          return response
        else
          raise Zuora::ClientError, response
        end
      end

    private

      def error_message(response)
        return response["message"] if response["message"]
        return error_messages(response["reasons"]) if response["reasons"]
        return error_messages(response["errors"]) if response["errors"]

        response.body
      end

      def error_messages(errors)
        errors.map do |error|
          "Error #{error['code']}: #{error['message'].humanize}"
        end.join("\n")
      end
    end
  end
end
