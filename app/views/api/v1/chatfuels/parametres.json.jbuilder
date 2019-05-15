json.messages do
  json.array! @message do
    json.attachment do
      json.type "template"
      json.payload do
        json.template_type "generic"
        json.image_aspect_ratio "square"
        json.elements do
          json.array! ["parametres"] do
            json.title "Paramètre ton compte"
            json.image_url "https://res.cloudinary.com/dyvlvy5co/image/upload/v1557924759/settings.png"
            json.subtitle "Consulte ton profile, Ajoute ta banque, ou Met en pause ton compte"
            json.buttons do
              json.array! @buttons do |b|
                if b[:title] == "Mettre en Pause"
                  json.type "show_block"
                  json.block_names b[:block_names]
                  json.title b[:title]
                else
                  json.type "web_url"
                  json.url b[:url]
                  json.title b[:title]
                end
              end
            end
          end
        end
      end
    end
  end
end

