class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cagnottes
  has_many :compte_bancaires
  has_many :budgets
  has_many :epargnes

  # validates :messenger_id, uniqueness: true
end
