class Api::V1::ChatfuelsController < Api::V1::BaseController
  def relevedecomptes
    user = User.where(messenger_id: params["messenger user id"])
    @cb = CompteBancaire.where(user: user)
    @cagnottes = Cagnotte.all
    @message = ["message"]
    @comptes = []
    @cb.each do |c|
      @comptes << c
    end
    @cagnottes.each do |cagnotte|
      @comptes << cagnotte
    end
  end
end
