json.messages do
  json.array! ["a"] do |l|
    json.text "Merci #{@lead.first_name} ! Nous revenons très vite vers toi."
  end
end
