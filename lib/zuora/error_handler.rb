module Zuora
  module ErrorHandler
    class UnknownError < StandardError; end
    class APIError < StandardError; end
    class NotFound < StandardError; end
    class BadRequest < StandardError; end
    class ParamError < StandardError; end
  end
end
