module Zuora
  class UnknownError < StandardError; end
  class APIError < StandardError; end

  class ErrorHandler
    def self.handle_response(response)
      return if response["success"]

      if response["success"].nil?
        raise Zuora::UnknownError.new(response)
      else
        raise Zuora::APIError.new(response["reasons"])
      end
    end
  end
end
