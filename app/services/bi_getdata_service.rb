require 'rest-client'

class BiGetdataService
  def initialize(code, redirect)
    @code = code
    @url = "https://depargneur.biapi.pro/2.0/users/ID/connections"
    @client_secret = ENV['BI_SECRET_KEY']
    @client_id = ENV['BI_CLIENT_ID']
  end

  def call
    payload = {
      code: @code,
      client_id: @client_id,
      client_secret: @client_secret
    }
    RestClient.post(@url, payload)
  end
end
