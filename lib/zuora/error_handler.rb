module Zuora
  class UnknownError < StandardError; end
  class APIError < StandardError; end

  class ErrorHandler
    def self.handle_response(response)
      # the response may be nested in a results array and have a different success key
      if !response["results"].nil?
        success_key = "Success"
        response = response["results"].first
      else
        success_key = "success"
      end
      return formatted_response(response.except(success_key)) if response[success_key]

      if response[success_key].nil?
        raise Zuora::UnknownError.new(response)
      else
        reason = humanize_reason(response)
        raise Zuora::APIError.new(reason)
      end
    end

    def self.formatted_response(response)
      formatted_response = response.deep_transform_keys!(&:underscore)
      unless Zuora.results_as_hash
        formatted_response = JSON.parse(formatted_response.to_json, object_class: OpenStruct)
      end
      formatted_response
    end

  private

    def self.humanize_reason(response)
      if !response["reasons"].nil?
        return response["reasons"].map do |reason_hash|
          "Error #{reason_hash['code']}: #{reason_hash['message'].humanize}"
        end.join("\n")
      elsif !response["Errors"].nil?
        return response["Errors"].map do |reason_hash|
          "Error #{reason_hash['Code']}: #{reason_hash['Message'].humanize}"
        end.join("\n")
      else
        "No error reason was provided"
      end

    end

  end
end
