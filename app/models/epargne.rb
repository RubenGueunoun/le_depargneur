class Epargne < ApplicationRecord
  belongs_to :user
  belongs_to :smart_saving_rule
end
