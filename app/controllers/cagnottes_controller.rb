class CagnottesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @user = User.find_by(messenger_id: params["messenger user id"].to_i)
    @cagnotte = Cagnotte.new
    authorize(@cagnotte)
  end

  def create
    @cagnotte = Cagnotte.new(cagnotte_params)
    @cagnotte.montant = 0
    @cagnotte.genre = "objectif"
    user = User.find(@cagnotte.user_id)
    authorize(@cagnotte)

    if @cagnotte.save
      redirect_to "https://www.ledepargneur.fr/show_cagnotte?cagnotte_id=#{@cagnotte.id} &messenger user id=#{user.messenger_id}"
    else
      redirect_to "https://www.ledepargneur.fr/cagnottes/new?messenger user id=#{user.messenger_id}"
    end
  end

  private

  def cagnotte_params
    params.require(:cagnotte).permit(:date, :objectif, :somme, :user_id)
  end
end
