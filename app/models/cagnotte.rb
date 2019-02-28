class Cagnotte < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :objectif, presence: true
  validates :genre, presence: true
  validates :somme, presence: true
end
