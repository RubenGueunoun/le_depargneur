require 'json'

class Budgea::WebhooksController < Budgea::BaseController

  def synchronized_data
    user = User.find_by(bi_token: request.headers["Authorization"])
    if user.blank?
      render json: {}, status: :not_found
    else
      render json: {}, status: :ok
      #response = JSON.parse(request.body.read)
      cb = user.compte_bancaires[0]
      cb.solde = params["connections"][0]["accounts"][0]["balance"]
      #cb.numero_compte = params["connections"]
      #cb.nom_banque = params
      #cb.solde = params.length
      cb.save!
    end
  end

end
