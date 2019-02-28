class EpargnesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :destroy]
  before_action :find_epargne, only: [:destroy]

  def create
    @epargne = Epargne.new(epargne_params)
    user = User.find(@epargne.user_id)
    authorize(@epargne)

    if @epargne.save
      if Rails.env == "development"
        redirect_to "http://localhost:3000/ma_depargne?messenger user id=#{user.messenger_id}"
      else
        redirect_to "https://www.ledepargneur.fr/ma_depargne?messenger user id=#{user.messenger_id}"
      end
    else
      if Rails.env == "development"
        redirect_to "https://localhost:3000/ma_depargne?messenger user id=#{user.messenger_id}"
      else
        redirect_to "https://www.ledepargneur.fr/ma_depargne?messenger user id=#{user.messenger_id}"
      end
    end
  end

  def destroy
    user = User.find(@epargne.user_id)
    @epargne.destroy
    if Rails.env == "development"
      redirect_to "http://localhost:3000/ma_depargne?messenger user id=#{user.messenger_id}"
    else
      redirect_to "https://www.ledepargneur.fr/ma_depargne?messenger user id=#{user.messenger_id}"
    end
  end

  private

  def find_epargne
    @epargne = Epargne.find(params[:id])
    authorize(@epargne)
  end

  def epargne_params
    params.require(:epargne).permit(:user_id, :smart_saving_rule_id)
  end
end
