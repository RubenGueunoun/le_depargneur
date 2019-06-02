class Budgea::WebhooksController < Api::V1::BaseController

  def synchronized_data
    user = User.find_by(bi_token: request.headers["Authorization"])
    if user.blank?
      render json: {}, status: :not_found
    else
      render json: {}, status: :ok
    end
    cb = user.compte_bancaires[0]
    cb.solde = 555
    cb.save!
  end

end
