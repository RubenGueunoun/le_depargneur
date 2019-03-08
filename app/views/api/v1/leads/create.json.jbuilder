json.messages do
  json.array! ["a"] do |l|
    json.text "Merci #{@lead.first_name} !
    Nous revenons très vite vers toi.

    En attendant, tu peux d'ores et déjà découvrir le dépargneur 😎"
  end
end
