class WebviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show_cb, :show_cagnotte, :associer_ssr, :ma_depargne, :ssr_pluie, :ssr_cigarette, :ssr_virement]
  before_action :find_user, only: [:show_cb, :show_cagnotte, :associer_ssr, :ma_depargne, :ssr_pluie, :ssr_cigarette, :ssr_virement]

  def show_cb
    fail
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
    a = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @depargne[:depargne_tranquille].id)
    b = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @depargne[:depargne_normal].id)
    c = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @depargne[:depargne_ambitieux].id)
    d = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @depargne[:depargne_1euro].id)
    e = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @depargne[:depargne_2euro].id)
    f = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @depargne[:depargne_5euro].id)
    @epargnes = {
      epargnes_tranquille: a.nil? ? "vide" : a,
      epargnes_normal: b.nil? ? "vide" : b,
      epargnes_ambitieux: c.nil? ? "vide" : c,
      epargnes_1euro: d.nil? ? "vide" : d,
      epargnes_2euro: e.nil? ? "vide" : e,
      epargnes_5euro: f.nil? ? "vide" : f
    }
    @epargne = Epargne.new()
    authorize(@epargne)
  end

  def ssr_pluie
    @user = User.find_by(messenger_id: @user_mi)
    @ssr_user = @user.epargnes
    @ssr = {
      ssr_samedi5: SmartSavingRule.find_by(nom: "météo", mecanisme: "samedi", niveau: "5"),
      ssr_samedi10: SmartSavingRule.find_by(nom: "météo", mecanisme: "samedi", niveau: "10"),
      ssr_samedi15: SmartSavingRule.find_by(nom: "météo", mecanisme: "samedi", niveau: "15"),
      ssr_dimanche5: SmartSavingRule.find_by(nom: "météo", mecanisme: "dimanche", niveau: "5"),
      ssr_dimanche10: SmartSavingRule.find_by(nom: "météo", mecanisme: "dimanche", niveau: "10"),
      ssr_dimanche15: SmartSavingRule.find_by(nom: "météo", mecanisme: "dimanche", niveau: "15")
    }
    a = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_samedi5].id)
    b = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_samedi10].id)
    c = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_samedi15].id)
    d = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_dimanche5].id)
    e = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_dimanche10].id)
    f = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_dimanche15].id)
    @epargnes_s = {
      epargnes_samedi5: a.nil? ? "vide" : a,
      epargnes_samedi10: b.nil? ? "vide" : b,
      epargnes_samedi15: c.nil? ? "vide" : c
    }
    @epargnes_d = {
      epargnes_dimanche5: d.nil? ? "vide" : d,
      epargnes_dimanche10: e.nil? ? "vide" : e,
      epargnes_dimanche15: f.nil? ? "vide" : f
    }
    @epargne = Epargne.new()
    authorize(@epargne)
  end

  def ssr_cigarette
    @user = User.find_by(messenger_id: @user_mi)
    @ssr_user = @user.epargnes
    @ssr = {
      ssr_cigarette1: SmartSavingRule.find_by(nom: "cigarette", mecanisme: "jour", niveau: "1"),
      ssr_cigarette2: SmartSavingRule.find_by(nom: "cigarette", mecanisme: "jour", niveau: "2"),
      ssr_cigarette3: SmartSavingRule.find_by(nom: "cigarette", mecanisme: "jour", niveau: "3")
    }
    a = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_cigarette1].id)
    b = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_cigarette2].id)
    c = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_cigarette3].id)
    @epargnes = {
      epargnes_cigarette1: a.nil? ? "vide" : a,
      epargnes_cigarette2: b.nil? ? "vide" : b,
      epargnes_cigarette3: c.nil? ? "vide" : c
    }
    @epargne = Epargne.new()
    authorize(@epargne)
  end

  def ssr_virement
    @user = User.find_by(messenger_id: @user_mi)
    @ssr_user = @user.epargnes
    @ssr = {
      ssr_pf10: SmartSavingRule.find_by(nom: "virement", mecanisme: "fixe", niveau: "10"),
      ssr_pf20: SmartSavingRule.find_by(nom: "virement", mecanisme: "fixe", niveau: "20"),
      ssr_pv2: SmartSavingRule.find_by(nom: "virement", mecanisme: "pourcentage", niveau: "2"),
      ssr_pv3: SmartSavingRule.find_by(nom: "virement", mecanisme: "pourcentage", niveau: "3"),
      ssr_pv5: SmartSavingRule.find_by(nom: "virement", mecanisme: "pourcentage", niveau: "5")
    }
    a = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_pf10].id)
    b = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_pf20].id)
    c = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_pv2].id)
    d = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_pv3].id)
    e = Epargne.find_by(user_id: @user.id, smart_saving_rule_id: @ssr[:ssr_pv5].id)
    @epargnes = {
      epargnes_pf10: a.nil? ? "vide" : a,
      epargnes_pf20: b.nil? ? "vide" : b,
      epargnes_pv2: c.nil? ? "vide" : c,
      epargnes_pv3: d.nil? ? "vide" : d,
      epargnes_pv5: e.nil? ? "vide" : e
    }
    @epargne = Epargne.new()
    authorize(@epargne)
  end

  private

  def find_user
    @user_mi = params["messenger user id"].to_i
  end
end
