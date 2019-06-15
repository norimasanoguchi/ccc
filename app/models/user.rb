class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :conversations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  validates :name, presence: true
  validates :birthday, presence: true
  validates :sex, presence: true
  validates :management, presence: true
  validates :chinese_skill, presence: true
  validates :email, presence: true, uniqueness: true
  validates :tel, numericality: true
  validates :wechat_id, length: { in: 1..30 }
  validates :visa_id, presence: true

  enum sex: {女: 0, 男: 1}
  enum edu_level: { bachelor: 0, doctor: 1, master: 2, high_school: 3,junior_high:4,other:5 }
  enum jlpt: {  N1: 1, N2: 2, N3: 3, N4: 4, N5: 5, no_certif: 0 }
  enum management: { yes: true, no: false }
  enum chinese_skill: { native: 0, fluent: 4, advanced: 3, intermediate: 2,beginner: 1 }
end
