json.messages do
  json.array! @message do
    json.text "On fait quoi ? 🧐"
    json.quick_replies do
      json.array! ["Mes comptes", "Ma Dépargne", "Cagnottes", "Smart Saving Rules", "Paramètres"] do |action|
        json.title action
        json.block_names ["Releve", "depargne"]
      end
    end
  end
end
