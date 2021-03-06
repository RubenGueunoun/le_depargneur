if @cb[0] == nil

  json.messages do
    json.array! @message do
      json.text "#{@user.prenom}, je n'ai pas encore accès à tes comptes 😞"
    end
  end

  json.messages do
    json.array! @message do
      json.attachment do
        json.type "template"
        json.payload do
          json.template_type "generic"
          json.image_aspect_ratio "square"
          json.elements do
            json.array! ["parametres"] do
              json.title "Connecte ta Banque au dépargneur"
              json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1557927419/bank.png"
              json.subtitle "Cet accès est 100\% sécurisé par notre partenaire Budget Insight©"
              json.buttons do
                json.array! ["button"] do
                  json.type "web_url"
                  json.url @url_bi
                  json.title "Ajouter ma Banque"
                  json.webview_height_ratio "full"
                end
              end
            end
          end
        end
      end
    end
  end

else

  json.messages do
    json.array! @message do
      json.text "#{@user.prenom}, voici tes comptes aujourd'hui 🤑"
    end
  end

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
                json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1557927419/bank.png"
                json.subtitle "Mis à jour #{compte.last_update}"
                json.default_action do
                  json.type "web_url"
                  json.url "www.ledepargneur.fr"
                  json.messenger_extensions false
                end
                json.buttons do
                  json.array! [compte] do
                    json.type "web_url"
                    json.url "https://www.ledepargneur.fr/show_cb?cb_id=#{compte.id}&messenger user id=#{compte.user.messenger_id}"
                    json.title "Compte Courant"
                    json.webview_height_ratio "tall"
                    json.messenger_extensions true
                  end
                end
              else
                json.title "#{compte.montant} €"
                if compte.genre == "depargne"
                  if compte.montant == 0
                    json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1559816129/safebox.png"
                  else
                    json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1559816124/safebox_1.png"
                  end
                else
                  json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1559811862/piggy-bank.png"
                end
                json.subtitle "Mis à jour #{compte.updated_at.to_date}"
                json.default_action do
                  json.type "web_url"
                  json.url "https://www.ledepargneur.fr"
                  json.messenger_extensions true
                end
                json.buttons do
                  json.array! [compte] do
                    json.type "web_url"
                    json.url "https://www.ledepargneur.fr/show_cagnotte?cagnotte_id=#{compte.id}&messenger user id=#{compte.user.messenger_id}"
                    json.title "💰 #{compte.objectif}"
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

  json.messages do
    json.array! @message do
      json.attachment do
        json.type "template"
        json.payload do
          json.template_type "button"
          json.text "Coup de 👍 ou de coup de 👎 ?"
          json.buttons do
            json.array! ["Déposer", "Retirer"] do |titre|
              json.type "show_block"
              if titre == "Déposer"
                json.block_names ["deposer"]
              else
                json.block_names ["retirer"]
              end
              json.title titre
            end
          end
        end
      end
    end
  end

end
