class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cagnottes
  has_many :compte_bancaires
  has_many :budgets
  has_and_belongs_to_many :smart_saving_rules

  validates :messenger_id, uniqueness: true
end
