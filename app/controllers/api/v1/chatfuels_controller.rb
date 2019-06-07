require 'csv'

class Api::V1::ChatfuelsController < Api::V1::BaseController
  before_action :find_user, only: [:relevedecomptes, :gestioncagnottes, :gestiondepargne, :gestionssr, :redirecttomenu, :profile, :parametres, :gestionpause]

  def relevedecomptes
    @cb = CompteBancaire.where(user: @user)
    @cagnottes = Cagnotte.where(user: @user)
    @message = ["message"]
    @comptes = []
    @cb.each do |c|
      @comptes << c
    end
    @cagnottes.each do |cagnotte|
      @comptes << cagnotte
    end
    if Rails.env == "development"
      redirect_url = "http:%2F%2Flocalhost:3000%2Fconnected_account"
    else
      redirect_url = "https:%2F%2Fwww.ledepargneur.fr%2Fconnected_account"
    end
    @url_bi = "https://depargneur.biapi.pro/2.0/auth/webview/connect/select?client_id=#{ENV['BI_CLIENT_ID']}&redirect_uri=#{redirect_url}"
  end

  def gestioncagnottes
    @message = ["message"]
  end

  def gestiondepargne
    @message = ["message"]
  end

  def gestionssr
    @message = ["message"]
  end

  def menuquickreplies
    @inscrit = false
    if User.find_by(messenger_id: params["messenger user id"])
      @inscrit = true
    else
      @inscrit = false
    end
    @message = ["message"]
  end

  def redirecttomenu
  end

  def veriftoken
    @nom = params["last name"]
    @prenom = params["first name"]
    @user_mi = params["messenger user id"]
    @message = ["message"]
    token_list = []
    @token_user = params["inscription_token"]
    @valid = false
    filepath = Rails.root.join('app', 'assets', 'data', 'token_depargneur.csv')
    csv_options = { col_sep: ',' }
    CSV.foreach(filepath, csv_options) { |row| token_list << { name: row[0], used: row[1] } }
    token_list.each do |tok|
      if tok[:name] == @token_user && tok[:used] == "no"
        @valid = true
      end
    end
  end

  def parametres
    @message = ["message"]
    if Rails.env == "development"
      redirect_url = "http:%2F%2Flocalhost:3000%2Fconnected_account"
    else
      redirect_url = "https:%2F%2Fwww.ledepargneur.fr%2Fconnected_account"
    end
    if @user.compte_bancaires.count == 0
      titre_bi = "Ajouter ma Banque"
      url_bi = "https://depargneur.biapi.pro/2.0/auth/webview/connect/select?client_id=#{ENV['BI_CLIENT_ID']}&redirect_uri=#{redirect_url}"
    else
      titre_bi = "Actualiser ma Banque"
      bi_token = @user.bi_token
      url_bi = "https://depargneur.biapi.pro/2.0/auth/webview/accounts?client_id=#{ENV['BI_CLIENT_ID']}&redirect_uri=#{redirect_url}##{bi_token}"
    end
    @buttons = [
      {
        url: "https://www.ledepargneur.fr",
        title: "Mon Profile",
      },
      {
        url: url_bi,
        title: titre_bi,
      },
      {
        block_names: ["pause"],
        title: @user.pause ? "Redémarrer" : "Mettre en Pause",
      }
    ]
  end

  def gestionpause
    if @user.pause
      @user.pause = false
    else
      @user.pause = true
    end
    @user.save!
    @message = ['message']
  end

  private

  def find_user
    @user = User.find_by(messenger_id: params["messenger user id"])
  end
end
