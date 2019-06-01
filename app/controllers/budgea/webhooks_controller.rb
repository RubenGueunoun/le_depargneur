class WebhooksController < ApplicationController
  before_action :load_user

  def synchronized_data
    user = @user
    cb = user.compte_bancaires[0]
    cb.solde = params[:connections][0][:accounts][0][:balance].to_i
    cb.save
  end

  private

  def load_user
    @user = User.find_by(bi_token: request.headers["Authorization"])
    render json: {}, status: "200" unless @user.blank?
  end
end
