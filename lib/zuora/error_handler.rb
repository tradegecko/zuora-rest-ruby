module Zuora
  module ErrorHandler
    class BaseError < StandardError; end
    class UnknownError < BaseError; end
    class APIError < BaseError; end
    class NotFound < BaseError; end
    class BadRequest < BaseError; end
  class UnknownError < StandardError; end
  class APIError < StandardError; end

# TODO Here we have a conflict, because our version has a ErrorHandler class, and the upstream version has an ErrorHandler module. 
  class ErrorHandler
    def self.handle_response(response)
      return formatted_response(response.except("success")) if response["success"]

      if response["success"].nil?
        raise Zuora::UnknownError.new(response)
      else
        reason = humanize_reason(response)
        raise Zuora::APIError.new(reason)
      end
    end

    def self.formatted_response(response)
      snake_cased_response = response.deep_transform_keys!(&:underscore)
      JSON.parse(snake_cased_response.to_json, object_class: OpenStruct)
    end

  private

    def self.humanize_reason(response)
      response["reasons"].map do |reason_hash|
        "Error #{reason_hash['code']}: #{reason_hash['message'].humanize}"
      end.join("\n")
    end

  end
end
