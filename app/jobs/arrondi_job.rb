class ArrondiJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    unless user.epargnes.count == 0
      all_depargne_ids = SmartSavingRule.where(nom: "dépargne").ids
      depargne_index = user.epargnes.index{ |epargne| all_depargne_ids.include?(epargne.smart_saving_rule_id)}
      unless depargne_index.nil?
        depargne = SmartSavingRule.find(user.epargnes[depargne_index].smart_saving_rule_id)
        if depargne.mecanisme == "simple"
          if depargne.niveau == "faible"
          elsif depargne.niveau == "moyen"
          else
          end
        else
          if depargne.niveau == "faible"
          elsif depargne.niveau == "moyen"
          else
          end
        end
      end
    end
  end
end
