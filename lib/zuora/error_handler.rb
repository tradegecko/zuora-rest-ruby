module Zuora
  class UnknownError < StandardError; end
  class APIError < StandardError; end

  class ErrorHandler
    def self.handle_response(response)
      success_key = 'success'
      ['Success', 'done', 'Done', 'results'].each do |key|
        success_key = key if response.key?(key)
      end
      return response.except(success_key) if response[success_key]

      if response[success_key].nil?
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
