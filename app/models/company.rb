class Company < ApplicationRecord
  has_many :conversations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable, :trackable

  validates :company_name, presence: true
end
