if @inscrit
  json.messages do
    json.array! @message do
      json.text "On fait quoi ? 🧐"
      json.quick_replies do
        json.array! ["Mes comptes", "Ma Dépargne", "Cagnottes", "Smart Saving Rules", "Paramètres"] do |action|
          json.title action
          if action == "Mes comptes"
            json.block_names ["Releve"]
          elsif action == "Ma Dépargne"
            json.block_names ["depargne"]
          elsif action == "Cagnottes"
            json.block_names ["+ cagnotte"]
          elsif action == "Smart Saving Rules"
            json.block_names ["ssr"]
          elsif action == "Paramètres"
            json.block_names ["parametres"]
          end
        end
      end
    end
  end
else
  json.messages do
    json.array! @message do
      json.text "Hâte de dépargner !"
      json.quick_replies do
        json.array! ["Je m'inscris", 'Modifier mail'] do |action|
          json.title action
          if action == "Je m'inscris"
            json.block_names ["inscription"]
          else
            json.block_names ["Devenir Dépargneur"]
          end
        end
      end
    end
  end
end
