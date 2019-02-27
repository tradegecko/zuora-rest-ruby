module Zuora
  module ErrorHandler
    class UnknownError < StandardError; end
    class APIError < StandardError; end

    class Base
      API_SUCCESS_KEYS = ['success', 'Success', 'done', 'Done'].freeze

      def self.handle_response(response)
        success_key = API_SUCCESS_KEYS.select { |key| response.key?(key) }.first
        return response.except(success_key) if success_key && response[success_key]

        if response.key?('results')
          return response
        elsif response[success_key].nil?
          raise UnknownError.new(response)
        else
          reason = humanize_reason(response)
          raise APIError.new(reason)
        end
      end

    private

      def self.humanize_reason(response)
        response["reasons"].map do |reason_hash|
          "Error #{reason_hash['code']}: #{reason_hash['message'].humanize}"
        end.join("\n")
      end
    end
  end
end
