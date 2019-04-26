module Zuora
  module ErrorHandler
    class Base
      API_SUCCESS_KEYS = ['success', 'Success', 'done', 'Done'].freeze

      def self.handle_response(response)
        success_key = API_SUCCESS_KEYS.select { |key| response.key?(key) }.first
        return response.except(success_key) if success_key && response[success_key]

        if response.key?('results')
          return response
        elsif response[success_key].nil?
          raise Zuora::ErrorHandler::UnknownError.new(response)
        else
          reason = humanize_reason(response)
          raise Zuora::ErrorHandler::APIError.new(reason)
        end
      end

    private

      def self.humanize_reason(response)
        error_object = response["reasons"] || response["errors"]
        error_object.map do |reason_hash|
          "Error #{reason_hash['code']}: #{reason_hash['message'].humanize}"
        end.join("\n")
      end
    end
  end
end
