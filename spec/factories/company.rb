FactoryBot.define do
  factory :company do
    company_name { 'テスト株式会社' }
    contact_person { 'テスト太郎' }
    tel { '00000000000' }
    email { 'testcompany@test.co.jp' }
  end
end