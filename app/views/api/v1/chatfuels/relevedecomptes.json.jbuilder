json.messages do
  json.array! @message do
    json.attachment do
      json.type "template"
      json.payload do
        json.template_type "list"
        json.top_element_style "large"
        json.elements do
          json.array! @comptes do |compte|
#            json.title "#{compte.class}"
#            json.image_url "http://rockets.chatfuel.com/assets/shirt.jpg"
#            json.subtitle "Compte courant"
            if compte.class == CompteBancaire
              json.title "#{compte.solde}"
              json.image_url "http://rockets.chatfuel.com/assets/shirt.jpg"
              json.subtitle "Compte courant"
            else
              json.title "#{compte.montant}"
              json.image_url "http://rockets.chatfuel.com/assets/shirt.jpg"
              json.subtitle "Cagnotte \"#{compte.objectif}\""
            end
          end
        end
      end
    end
  end
end
