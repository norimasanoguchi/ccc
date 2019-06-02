class Conversation < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, class_name: 'User'
  belongs_to :company, foreign_key: :company_id, class_name: 'Company'

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :user_id ,scope: :company_id

  scope :between, ->(user_id,company_id) do
    where(["(conversations.user_id =? AND conversations.company_id =?)", company_id,user_id])
  end

  def target_user(current_user)
    if user_id == current_user.id
      Company.find(company_id)
    elsif company_id == current_company.id
      User.find(user_id)
    end
  end
end
