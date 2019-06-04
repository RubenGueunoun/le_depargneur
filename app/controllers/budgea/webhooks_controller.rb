require 'json'
#require 'ostruct'

class Budgea::WebhooksController < Budgea::BaseController

  def synchronized_data
    user = User.find_by(bi_token: request.headers["Authorization"])
    if user.blank?
      render json: {}, status: :not_found
    else
      render json: {}, status: :ok

      i = params["connections"][0]["accounts"].index { |account| account["name"]. == "Compte chèque"}

      cb = CompteBancaire.create!(
        user_id: user.id,
        nom_banque: params["connections"][0]["bank"]["name"],
        numero_compte: params["connections"][0]["accounts"][i]["number"],
        solde: params["connections"][0]["accounts"][i]["balance"],
        rythme: 1,
        iban: params["connections"][0]["accounts"][i]["iban"],
        nom: params["connections"][0]["accounts"][i]["name"],
        statut: "connected",
        )

      params["connections"][0]["accounts"][i]["transactions"].each do |transaction|
        if transaction["new"]
          Operation.create!(
            compte_bancaire_id: cb.id,
            date: transaction["date"],
            categorie: transaction["id_category"],
            libelle: transaction["simplified_wording"],
            montant: transaction["value"],
            depargne: false,
            bi_id: transaction["id"]
            )
        else
        end
      end

    end
  end

end
