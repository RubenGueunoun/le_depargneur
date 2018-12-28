class CompteBancaire < ApplicationRecord
  belongs_to :user
  has_many :operations
end
