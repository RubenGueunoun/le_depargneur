#json.cagnottes do
#  json.array! @cagnottes do |cagnotte|
#    json.extract! cagnotte, :id, :user_id, :genre, :date, :montant, :objectif
#  end
#end

json.messages do
  json.array! @cagnottes do |cagnotte|
    json.text "Tu as depargne #{cagnotte.montant}"
  end
end
