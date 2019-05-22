json.messages do
  json.array! @message do
    json.attachment do
      json.type "template"
      json.payload do
        json.template_type "list"
        json.top_element_style "large"
        json.elements do
          json.array! ["message","pluie", "cigarette", "virement"] do |m|
            if m == "message"
              json.title "Des règles d'épargnes adaptées à ton style de vie"
              json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1551375468/engrenage.webp"
            elsif m == "pluie"
              json.title "J'aime pas la pluie"
              json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1551375461/rain.png"
              json.subtitle "Weekend pluvieux ? Profite en et met de côté automatiquement"
              json.default_action do
                json.type "web_url"
                json.url "www.ledepargneur.fr"
                json.messenger_extensions false
              end
              json.buttons do
                json.array! [m] do
                  json.type "web_url"
                  json.url "https://www.ledepargneur.fr/ssr_pluie?messenger user id=#{@user.messenger_id}"
                  json.title "Paramétrer"
                  json.webview_height_ratio "tall"
                  json.messenger_extensions true
                end
              end
            elsif m == "cigarette"
              json.title "J'arrête de fumer"
              json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1551375502/no-smoking-sign.png"
              json.subtitle "Je t'aide à arrêter de fumer en mettant de côté pour te récompenser"
              json.default_action do
                json.type "web_url"
                json.url "www.ledepargneur.fr"
                json.messenger_extensions false
              end
              json.buttons do
                json.array! [m] do
                  json.type "web_url"
                  json.url "https://www.ledepargneur.fr/ssr_cigarette?messenger user id=#{@user.messenger_id}"
                  json.title "Paramétrer"
                  json.webview_height_ratio "tall"
                  json.messenger_extensions true
                end
              end
            else
              json.title "🍕 d'un virement reçu de côté"
              json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1551375509/calendar.png"
              json.subtitle "Parfois le meilleur moment pour donner un coup de boost à tes projets"
              json.default_action do
                json.type "web_url"
                json.url "www.ledepargneur.fr"
                json.messenger_extensions false
              end
              json.buttons do
                json.array! [m] do
                  json.type "web_url"
                  json.url "https://www.ledepargneur.fr/ssr_virement?messenger user id=#{@user.messenger_id}"
                  json.title "Paramétrer"
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
