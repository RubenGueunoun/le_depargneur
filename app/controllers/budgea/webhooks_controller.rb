require 'json'

class Budgea::WebhooksController < Api::V1::BaseController

  def synchronized_data
    user = User.find_by(bi_token: request.headers["Authorization"])
    if user.blank?
      render json: {}, status: :not_found
    else
      render json: {}, status: :ok
      #response = JSON.parse(request.body.read)
      cb = user.compte_bancaires[0]
      #cb.solde = response["connections"][0]["accounts"][0]["balance"]
      cb.numero_compte = request.body.read
      cb.save!
    end
  end

end
