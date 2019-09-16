#TODO: Deprecated -- Remove me
module Zuora
  module ErrorHandler
    class UnknownError < StandardError; end
    class APIError < StandardError; end
    class NotFound < StandardError; end
    class BadRequest < StandardError; end
  end
end
