module Zuora
  module ErrorHandler
    class BaseError < StandardError
    class UnknownError < BaseError; end
    class APIError < BaseError; end
    class NotFound < BaseError; end
    class BadRequest < BaseError; end
  end
end
