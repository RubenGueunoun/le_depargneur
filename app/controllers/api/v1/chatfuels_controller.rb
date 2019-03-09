require 'csv'

class Api::V1::ChatfuelsController < Api::V1::BaseController
  before_action :find_user, only: [:relevedecomptes, :gestioncagnottes, :gestiondepargne, :gestionssr, :redirecttomenu]

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
    @token_list = []
    filepath = "/Users/rubengueunoun/code/RubenGueunoun/le_depargneur/app/assets/data/token_depargneur.csv"
    csv_options = { col_sep: ',', headers: :first_row }
    CSV.foreach(filepath, csv_options) do |row|
      @token_list << row["token"]
    end
  end

  private

  def find_user
    @user = User.where(messenger_id: params["messenger user id"])
  end
end
