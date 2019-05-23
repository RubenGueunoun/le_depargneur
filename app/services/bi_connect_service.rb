require 'rest-client'
class BiConnectService
  def initialize(code, redirect)
    @code = code
    @url = "https://accounts.spotify.com/api/token"
    @client_secret = ENV['BI_SECRET_KEY']
    @client_id = ENV['BI_CLIENT_ID']
    @redirect = "https://www.ledepargneur.fr#{redirect}"
  end

  def call
    payload = {
      grant_type: "authorization_code",
      code: @code,
      redirect_uri: @redirect,
      client_id: @client_id,
      client_secret: @client_secret
    }
    RestClient.post(@url, payload, content_type: 'application/x-www-form-urlencoded')
  end
end
