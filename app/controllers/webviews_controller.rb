class WebviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show_cb]

  def show_cb
    @user_mi = params["messenger user id"].to_i
    @cb = CompteBancaire.find(params[:cb_id])
    authorize(@cb)
  end
end
