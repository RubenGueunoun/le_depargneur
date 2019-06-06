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
              json.title "Paramétre ta dépargne"
              json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1559811767/wallet.png"
            else
              json.title "Configure tes règles comme tu veux"
              json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1559811667/salary_1.png"
              json.subtitle "Et met de côté à chacune de tes dépenses"
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
                  json.webview_height_ratio "tall"
                  json.messenger_extensions true
                end
              end
            end
          end
        end
      end
    end
  end
end
