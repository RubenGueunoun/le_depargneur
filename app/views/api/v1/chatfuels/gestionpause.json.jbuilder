if @user.pause
  json.messages do
    json.array! @message do
      json.text "#{@user.prenom}, ton compte est désormais en pause. Reviens nous vite 😞"
    end
  end
else
    json.messages do
    json.array! @message do
      json.text "Félicitations #{@user.prenom}, ton compte est actif à nouveau ! 🚀"
    end
  end
end
