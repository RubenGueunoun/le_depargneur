#json.cagnottes do
#  json.array! @cagnottes do |cagnotte|
#    json.extract! cagnotte, :id, :user_id, :genre, :date, :montant, :objectif
#  end
#end

json.messages do
  json.array! @cb do |cb|
    json.text "Solde: #{cb.solde}€
    Rythme de dépense: #{cb.rythme}

    Dépargne: #{@montant} €
    "
  end
end
