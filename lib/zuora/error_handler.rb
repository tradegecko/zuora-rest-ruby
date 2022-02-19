module Zuora
  module ErrorHandler
    class BaseError < StandardError; end
    class UnknownError < BaseError; end
    class APIError < BaseError; end
    class NotFound < BaseError; end
    class BadRequest < BaseError; end
  end
end
