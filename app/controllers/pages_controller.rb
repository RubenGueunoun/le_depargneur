require 'ostruct'
require 'json'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :token_already_used, :connected_account]

  def home
  end

  def token_already_used
  end

  def pre_created
    redirect_url = "https:%2F%2Fwww.ledepargneur.fr%2Fconnected_account"
    @url = "https://depargneur.biapi.pro/2.0/auth/webview/connect/select?client_id=#{ENV['BI_CLIENT_ID']}&redirect_uri=#{redirect_url}"
  end

  def connected_account
    if params["code"]
      response = JSON.parse(BiConnectService.new(params["code"], "/connected_account").call)
      current_user.bi_token = response["access_token"]
      current_user.cb_status = "connected" if response["access_token"]
      @valid = true unless response["error"]
      current_user.save
    end
  end

end
