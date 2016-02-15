module Zuora
  class UnknownError < StandardError; end
  class APIError < StandardError; end

  class ErrorHandler
    def self.handle_response(response)
      return response.except("success") if response["success"]

      if response["success"].nil?
        raise Zuora::UnknownError.new(response)
      else
        reason = humanize_reason(response)
        raise Zuora::APIError.new(reason)
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
