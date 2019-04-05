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
    @message = ["message"]
    token_list = [{name:"8C523",used:"no"},{name:"BDC7B",used:"no"},{name:"77A9A",used:"no"},{name:"346EC",used:"no"},{name:"92B13",used:"no"},{name:"B51C4",used:"no"}]
    @token_user = params["inscription_token"]
    @valid = false
    filepath = "/Users/rubengueunoun/code/RubenGueunoun/le_depargneur/app/assets/data/token_depargneur.csv"
    csv_options = { col_sep: ',' }
    #CSV.foreach(filepath, csv_options) { |row| token_list << { name: row[0], used: row[1] } }
    token_list.each do |tok|
      if tok[:name] == @token_user
        @valid = true
      end
    end
  end

  private

  def find_user
    @user = User.find_by(messenger_id: params["messenger user id"])
  end
end
