if @valid
  json.messages do
    json.array! @message do
      json.attachment do
        json.type "template"
        json.payload do
          json.template_type "button"
          json.text "Token validé ! Félicitations, vous pouvez désormais vous inscrire en cliquant sur le bouton ci-dessous:"
          json.buttons do
            json.array! ["b"] do
              json.type "web_url"
              json.url "https://www.ledepargneur.fr/users/sign_up?token=#{@token_user}"
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
