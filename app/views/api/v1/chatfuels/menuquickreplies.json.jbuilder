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
          json.url "https://www.ledepargneur.fr/api/v1/gestioncagnottes?messenger user id=#{@user.messenger_id}"
          json.type "json_plugin_url"
        elsif action == "Smart Saving Rules"
          json.block_names ["ssr"]
        elsif action == "Paramètres"
          json.block_names ["parametres"]
        end
      end
    end
  end
end
