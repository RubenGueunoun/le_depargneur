class Budgea::WebhooksController < Api::V1::BaseController

  def synchronized_data
    user = User.find_by(bi_token: request.headers["Authorization"])
    if user.blank?
      render json: {}, status: :not_found
    else
      render json: {}, status: :ok
    end
    cb = user.compte_bancaires[0]
    cb.solde = params["connections"][0]["accounts"][0]["balance"]
    cb.save!
  end

end
