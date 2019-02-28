json.messages do
  json.array! @message do
    json.attachment do
      json.type "template"
      json.payload do
        json.template_type "list"
        json.top_element_style "large"
        json.elements do
          json.array! ["message","mes"] do |m|
            json.title "Paramétre ta dépargne"
            json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1551361347/pay.png"
            json.subtitle "Configure tes règles comme tu veux"
            json.default_action do
              json.type "web_url"
              json.url "www.ledepargneur.fr"
              json.messenger_extensions false
            end
            json.buttons do
              json.array! [m] do
                json.type "web_url"
                json.url "https://www.ledepargneur.fr/ma_depargne?messenger user id=#{@user.messenger_id}"
                json.title "Gérer"
              end
            end
          end
        end
      end
    end
  end
end
