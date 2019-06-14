FactoryBot.define do
  factory :user do
    name { 'テストユーザー1' }
    email { 'test1@example.com' }
    password  { 'password' }
    birthday { '2019-01-01' }
    sex { '男' }
    tel { "000-0000-0000" }
    wechat_id { "test" }
    edu_level { "bachelor" }
    jlpt { "no_certif" }
    management { "no" }
    chinese_skill { "native" }
    visa_id { "1" }
    prefecture_id { "1" }
    image { "nil" }
  end
end