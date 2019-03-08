class Api::V1::ChatfuelsController < Api::V1::BaseController

  def relevedecomptes
    user = User.where(messenger_id: params["messenger user id"])
    @cb = CompteBancaire.where(user: user)
    @cagnottes = Cagnotte.where(user: user)
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
    @user = User.find_by(1320234228077013)
    @message = ["message"]
  end

  def gestiondepargne
    @user = User.find_by(messenger_id: params["messenger user id"])
    @message = ["message"]
  end

  def gestionssr
    @user = User.find_by(messenger_id: params["messenger user id"])
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
    @user = User.find_by(messenger_id: params["messenger user id"])
  end
end
