class User < ApplicationRecord
  has_one :visa
  has_one :prefecture

  validates :name, presence: true
  validates :birthday, presence: true
  validates :sex, presence: true
  validates :management, presence: true
  validates :chinese_skill, presence: true
  validates :email, presence: true, uniqueness: true, confirmation: true
  validates :email_confirmation, presence: true
  validates :tel, numericality: true
  validates :wechat_id, length: { in: 1..30 }
  validates_associated :visa
  validates_associated :prefecture

  enum sex: { female: 0, male: 1 }
  enum edu_lebel: { bachelor: 0, doctor: 1, master: 2, high_school: 3,junior_high:4,other:5 }
  enum jlpt: { none: 0, N1: 1, N2: 2, N3: 3, N4: 4, N5: 5 }
  enum management: { yes: true, no: false }
  enum chinese_skill: { native: 0, beginner: 1, intermediate: 2, advanced: 3, fluent: 4 }
end
