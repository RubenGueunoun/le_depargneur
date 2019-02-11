json.messages do
  json.array! @message do
    json.attachment do
      json.type "template"
      json.payload do
        json.template_type "list"
        json.top_element_style "large"
        json.elements do
          json.array! @comptes do |compte|
            if compte.class == CompteBancaire
              json.title "#{compte.solde} €"
              json.image_url "http://rockets.chatfuel.com/assets/shirt.jpg"
              json.subtitle "Mis à jour #{compte.updated_at.to_date}"
              json.default_action do
                json.type "web_url"
                json.url "https://peaceful-plateau-65677.herokuapp.com"
                json.messenger_extensions false
              end
              json.buttons do
                json.array! [compte] do
                  json.type "web_url"
                  json.url "https://peaceful-plateau-65677.herokuapp.com"
                  json.title "Compte Courant"
                end
              end
            else
              json.title "#{compte.montant} €"
              json.image_url "http://rockets.chatfuel.com/assets/shirt.jpg"
              json.subtitle "Mis à jour #{compte.updated_at.to_date}"
              json.default_action do
                json.type "web_url"
                json.url "https://peaceful-plateau-65677.herokuapp.com"
                json.messenger_extensions false
              end
              json.buttons do
                json.array! [compte] do
                  json.type "web_url"
                  json.url "https://peaceful-plateau-65677.herokuapp.com"
                  json.title "Cagnotte \"#{compte.objectif}\""
                end
              end
            end
          end
        end
      end
    end
  end
end
