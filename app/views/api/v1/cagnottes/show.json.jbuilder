# json.cagnotte do
#  json.extract! @cagnotte, :id, :user_id, :genre, :date, :montant, :objectif
#end

json.messages do
  json.text "Ta cagnotte #{@cagnotte.objectif} d'un montant de #{@cagnotte.montant} € pour la date du #{@cagnotte.date} a bien été crée"
end
