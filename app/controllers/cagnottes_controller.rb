class CagnottesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_cagnotte, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    user = User.find(@cagnotte.user_id)
    authorize(@cagnotte)

    if @cagnotte.update(cagnotte_params)
      redirect_to "https://www.ledepargneur.fr/show_cagnotte?cagnotte_id=#{@cagnotte.id} &messenger user id=#{user.messenger_id}"
    else
      redirect_to "https://www.ledepargneur.fr/cagnottes/edit?messenger user id=#{user.messenger_id}"
    end
  end

  def destroy
    user = User.find(@cagnotte.user_id)
    @cagnotte.transactions.each do |transaction|
      authorize(transaction)
      transaction.destroy
    end

    @cagnotte.destroy
    redirect_to "https://www.ledepargneur.fr/cagnottes/new?messenger user id=#{user.messenger_id}"
  end

  private

  def find_cagnotte
    @cagnotte = Cagnotte.find(params[:id])
    authorize(@cagnotte)
  end

  def cagnotte_params
    params.require(:cagnotte).permit(:date, :objectif, :somme, :user_id)
  end
end