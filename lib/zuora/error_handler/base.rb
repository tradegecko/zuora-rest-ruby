module Zuora
  module ErrorHandler
    class Base
      API_SUCCESS_KEYS = ['success', 'Success', 'done', 'Done'].freeze

      def self.handle_response(response)
        response = response["results"].first if response["results"].present?

        success_key = API_SUCCESS_KEYS.select { |key| response.key?(key) }.first
        return formatted_response(response.except(success_key)) if success_key && response[success_key]

        if response[success_key].nil?
          raise Zuora::ErrorHandler::UnknownError.new(response)
        else
          reason = humanize_reason(response)
          raise Zuora::ErrorHandler::APIError.new(reason)
        end
      end

    private

      def self.humanize_reason(response)
        error_object = response["reasons"] || response["errors"] || response["Errors"]
        error_object.map do |reason_hash|
          "Error #{(reason_hash['code'] || reason_hash['Code'])}: #{(reason_hash['message'] || reason_hash['Message']).humanize}"
        end.join("\n")
      end


      def self.formatted_response(response)
        formatted_response = response.deep_transform_keys!(&:underscore)
        unless Zuora.results_as_hash
          formatted_response = JSON.parse(formatted_response.to_json, object_class: OpenStruct)
        end
        formatted_response
      end
    end
  end
end
