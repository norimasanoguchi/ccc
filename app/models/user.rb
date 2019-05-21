class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  has_one :visa
  has_one :prefecture

  validates :name, presence: true
  validates :birthday, presence: true
  validates :sex, presence: true
  validates :management, presence: true
  validates :chinese_skill, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :email, presence: true, uniqueness: true, confirmation: true
  # validates :email_confirmation, presence: true
  validates :tel, numericality: true
  validates :wechat_id, length: { in: 1..30 }
  validates :visa_id, presence: true
  # validates :prefecture_id, uniqueness: true, presence: true

  enum sex: {女: 0, 男: 1}
  enum edu_level: { bachelor: 0, doctor: 1, master: 2, high_school: 3,junior_high:4,other:5 }
  enum jlpt: { no_certif: 0, N1: 1, N2: 2, N3: 3, N4: 4, N5: 5 }
  enum management: { yes: true, no: false }
  enum chinese_skill: { native: 0, beginner: 1, intermediate: 2, advanced: 3, fluent: 4 }
end
