require "rubygems"
require "httparty"

require "zuora/version"

module Zuora
  class << self
    attr_accessor :username, :password
  end
end
