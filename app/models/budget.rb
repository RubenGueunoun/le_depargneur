class Budget < ApplicationRecord
  belongs_to :user
  has_many :poste_depenses
end
