class EpargnesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :find_epargne, only: [:update, :destroy]

  def create
    @epargne = Epargne.new(epargne_params)
    authorize(@epargne)
    url = request.env["HTTP_REFERER"]

    if @epargne.save
      redirect_to url
    else
      redirect_to url
    end
  end

  def update
    url = request.env["HTTP_REFERER"]

    if @epargne.update(epargne_params)
      authorize(@epargne)
      redirect_to url
    else
      redirect_to url
    end
  end

  def destroy
    @epargne.destroy
    url = request.env["HTTP_REFERER"]
    redirect_to url
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
