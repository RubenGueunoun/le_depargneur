class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :token_already_used]

  def home
  end

  def token_already_used
  end

  def pre_created
    redirect_url = "https:%2F%2Fwww.ledepargneur.fr"
    @url = "https://depargneur.biapi.pro/2.0/auth/webview/connect/select?client_id=#{ENV['BI_CLIENT_ID']}&redirect_uri=#{redirect_url}"
  end
end
