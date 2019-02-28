json.messages do
  json.array! @message do
    json.attachment do
      json.type "template"
      json.payload do
        json.template_type "list"
        json.top_element_style "large"
        json.elements do
          json.array! ["message","mes"] do |m|
            if m == "message"
              json.title "Nouvelle cagnotte"
              json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1549896001/piggy-bank-solid.png"
              json.default_action do
                json.type "web_url"
                json.url "www.ledepargneur.fr"
                json.messenger_extensions false
              end
              json.buttons do
                json.array! [m] do
                  json.type "web_url"
                  json.url "https://www.ledepargneur.fr/cagnottes/new?messenger user id=#{@user.messenger_id}"
                  json.title "Ajouter"
                end
              end
            else
              json.title "Nouvelle cagnotte"
              json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1549896001/piggy-bank-solid.png"
              json.subtitle "Ajoute une nouvelle cagnotte"
              json.default_action do
                json.type "web_url"
                json.url "www.ledepargneur.fr"
                json.messenger_extensions false
              end
              json.buttons do
                json.array! [m] do
                  json.type "web_url"
                  json.url "https://www.ledepargneur.fr/cagnottes/new?messenger user id=#{@user.messenger_id}"
                  json.title "Ajouter"
                end
              end
            end
          end
        end
      end
    end
  end
end
