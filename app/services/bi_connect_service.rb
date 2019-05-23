require 'rest-client'
class BiConnectService
  def initialize(code, redirect)
    @code = code
    @url = "https://depargneur.biapi.pro/2.0//auth/token/access"
    @client_secret = ENV['BI_SECRET_KEY']
    @client_id = ENV['BI_CLIENT_ID']
    @redirect = "https://www.ledepargneur.fr#{redirect}"
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
