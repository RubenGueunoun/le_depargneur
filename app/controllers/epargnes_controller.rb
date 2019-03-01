class EpargnesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :find_epargne, only: [:update, :destroy]

  def create
    @epargne = Epargne.new(epargne_params)
    authorize(@epargne)
    url = request.env["HTTP_REFERER"]

    if @epargne.save
      respond_to do |format|
        format.html { redirect_to url }
        format.js { }
      end
    else
      respond_to do |format|
        format.html { redirect_to url }
        format.js { }
      end
    end
  end

  def update
    url = request.env["HTTP_REFERER"]

    if @epargne.update(epargne_params)
      authorize(@epargne)
      respond_to do |format|
        format.html { redirect_to url }
        format.js { }
      end
    else
      respond_to do |format|
        format.html { redirect_to url }
        format.js { }
      end
    end
  end

  def destroy
    @epargne.destroy
    url = request.env["HTTP_REFERER"]
    respond_to do |format|
      format.html { redirect_to url }
      format.js { }
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
