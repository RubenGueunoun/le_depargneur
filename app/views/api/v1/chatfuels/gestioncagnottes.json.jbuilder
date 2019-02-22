json.messages do
  json.array! @message do
    json.attachment do
      json.type "template"
      json.payload do
        json.template_type "generic"
        json.top_element_style "large"
        json.elements do
          json.title "Nouvelle cagnotte"
          json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1549896001/piggy-bank-solid.png"
          json.buttons do
            json.array! ["cagnotte"] do
              json.type "web_url"
              json.url "https://www.ledepargneur.fr/cagnottes/new?messenger user id=#{@user.messenger_id}"
              json.title "+"
            end
          end
        end
      end
    end
  end
end
