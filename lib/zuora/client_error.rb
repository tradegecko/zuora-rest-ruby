module Zuora
  class ClientError < StandardError
    attr_accessor :code
    def initialize(code, message)
      @code = code
      super message
    end
  end
end
