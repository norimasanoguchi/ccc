class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  validates_presence_of :body, :conversation_id
  validates :user_id, presence: true , if: -> { company_id.blank? }
  validates :company_id, presence: true, if: -> { user_id.blank? }

  def message_time
    created_at.strftime("%m/%d/%y at %I:%M %p")
  end
end
