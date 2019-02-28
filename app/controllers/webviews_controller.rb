class WebviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show_cb, :show_cagnotte, :associer_ssr, :ma_depargne]
  before_action :find_user, only: [:show_cb, :show_cagnotte, :associer_ssr, :ma_depargne]

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

  def ma_depargne
    @user = User.find_by(messenger_id: @user_mi)
    @ssr_user = @user.epargnes
    @ssr = SmartSavingRule.where(nom: "dépargne")
    @depargne = {
      depargne_tranquille: SmartSavingRule.find_by(nom: "dépargne", mecanisme: "intelligent", niveau: "faible"),
      depargne_normal: SmartSavingRule.find_by(nom: "dépargne", mecanisme: "intelligent", niveau: "moyen"),
      depargne_ambitieux: SmartSavingRule.find_by(nom: "dépargne", mecanisme: "intelligent", niveau: "fort"),
      depargne_1euro: SmartSavingRule.find_by(nom: "dépargne", mecanisme: "simple", niveau: "faible"),
      depargne_2euro: SmartSavingRule.find_by(nom: "dépargne", mecanisme: "simple", niveau: "moyen"),
      depargne_5euro: SmartSavingRule.find_by(nom: "dépargne", mecanisme: "simple", niveau: "fort")
    }
    @epargnes = {
      epargnes_tranquille: Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @depargne[:depargne_tranquille].id),
      epargnes_normal: Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @depargne[:depargne_normal].id),
      epargnes_ambitieux: Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @depargne[:depargne_ambitieux].id),
      epargnes_1euro: Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @depargne[:depargne_1euro].id),
      epargnes_2euro: Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @depargne[:depargne_2euro].id),
      epargnes_5euro: Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @depargne[:depargne_5euro].id)
    }
    @epargne = Epargne.new()
    authorize(@epargne)
  end

  private

  def find_user
    @user_mi = params["messenger user id"].to_i
  end
end
