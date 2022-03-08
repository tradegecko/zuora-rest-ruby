require 'bundler/setup'
Bundler.setup

require 'zuora-rest'
require 'webmock/rspec'
require 'pry'

RSpec.configure do |config|

end

Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].sort.each {|f| require f}
