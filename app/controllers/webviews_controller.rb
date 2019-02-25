class WebviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show_cb, :show_cagnotte, :associer_ssr]
  before_action :find_user, only: [:show_cb, :show_cagnotte, :associer_ssr]

  def show_cb
    @cb = CompteBancaire.find(params[:cb_id])
    authorize(@cb)
  end

  def show_cagnotte
    @cagnotte = Cagnotte.find(params[:cagnotte_id])
    authorize(@cagnotte)
  end

  def associer_ssr
    @ssr = SmartSavingRule.all
    authorize(@ssr)
  end


  private

  def find_user
    @user_mi = params["messenger user id"].to_i
  end
end
