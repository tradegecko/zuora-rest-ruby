module Zuora
  class HttpClient
    include HTTParty

    format  :json
    headers "Accept" => "application/json"
    headers "Content-Type" => "application/json"
  end
end
