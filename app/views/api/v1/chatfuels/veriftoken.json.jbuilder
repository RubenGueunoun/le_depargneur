if @valid
  json.messages do
    json.array! @message do
      json.attachment do
        json.type "template"
        json.payload do
          json.template_type "button"
          json.text "Token validé !
Félicitations, tu peux désormais t'inscrire en cliquant sur le bouton ci-dessous:"
          json.buttons do
            json.array! ["b"] do
              json.type "web_url"
              json.url "https://www.ledepargneur.fr/users/sign_up?token=#{@token_user}&messenger_user_id=#{@user_mi}&nom=#{@nom}&prenom=#{@prenom}"
              json.title "Je m'inscris"
            end
          end
        end
      end
    end
  end
else
  json.messages do
    json.array! @message do
      json.text "Token invalide"
    end
  end
end
