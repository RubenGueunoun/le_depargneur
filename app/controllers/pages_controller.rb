require 'ostruct'
require 'json'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :token_already_used, :connected_account, :synchronized_data]

  def home
  end

  def token_already_used
  end

  def pre_created
    if Rails.env == "development"
      redirect_url = "http:%2F%2Flocalhost:3000%2Fconnected_account"
    else
      redirect_url = "https:%2F%2Fwww.ledepargneur.fr%2Fconnected_account"
    end
    @url = "https://depargneur.biapi.pro/2.0/auth/webview/connect/select?client_id=#{ENV['BI_CLIENT_ID']}&redirect_uri=#{redirect_url}"
  end

  def connected_account
    if params["code"]
      response = JSON.parse(BiConnectService.new(params["code"], "/connected_account").call)
      if response["access_token"]
        current_user.bi_token = "Bearer #{response["access_token"]}"
        current_user.cb_status = "connected"
      end
      @valid = true unless response["error"]
      current_user.save
    end
  end
end
