# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.connection.execute("TRUNCATE TABLE users CASCADE;")
Visa.connection.execute("TRUNCATE TABLE visas CASCADE;")
visas = Visa.create!([
                      {name: "技術・人文知識・国際業務"},
                      {name: "留学"},
                      {name: "家族滞在"},
                      {name: "特定活動"},
                      {name: "日本国籍"},
                      {name: "永住者"},
                      {name: "技能実習"},
                      {name: "日本人の配偶者等"},
                      {name: "特定技能"},
                      {name: "定住者"},
                      {name: "技能"},
                      {name: "永住者の配偶者等"},
                      {name: "企業内転勤"},
                      {name: "特別永住者"},
                      {name: "短期滞在"},
                      {name: "経営・管理"},
                      {name: "高度専門職"},
                      {name: "教授、芸術、宗教、報道"},
                      {name: "法律・会計業務"},
                      {name: "医療、介護"},
                      {name: "文化活動、興行"},
                      {name: "研修"},
                      {name: "外交、公用"},
                      {name: "ビザなし"}])

Prefecture.connection.execute("TRUNCATE TABLE prefectures CASCADE;")
prefectures = Prefecture.create!([
                      {name: "東京"},
                      {name: "神奈川"},
                      {name: "埼玉"},
                      {name: "大阪"},
                      {name: "千葉"},
                      {name: "愛知"},
                      {name: "兵庫"},
                      {name: "福岡"},
                      {name: "北海道"},
                      {name: "海外（中国）"},
                      {name: "海外（台湾）"},
                      {name: "海外（その他）"},
                      {name: "広島"},
                      {name: "京都"},
                      {name: "茨城"},
                      {name: "岐阜"},
                      {name: "静岡"},
                      {name: "長野"},
                      {name: "岡山"},
                      {name: "三重"},
                      {name: "群馬"},
                      {name: "栃木"},
                      {name: "宮城"},
                      {name: "富山"},
                      {name: "新潟"},
                      {name: "滋賀"},
                      {name: "石川"},
                      {name: "愛媛"},
                      {name: "熊本"},
                      {name: "香川"},
                      {name: "福島"},
                      {name: "山梨"},
                      {name: "福井"},
                      {name: "大分"},
                      {name: "奈良"},
                      {name: "山口"},
                      {name: "長崎"},
                      {name: "鹿児島"},
                      {name: "山形"},
                      {name: "沖縄"},
                      {name: "岩手"},
                      {name: "徳島"},
                      {name: "島根"},
                      {name: "宮崎"},
                      {name: "和歌山"},
                      {name: "佐賀"},
                      {name: "高知"},
                      {name: "青森"},
                      {name: "秋田"},
                      {name: "鳥取"}])

30.times do |n|
  Faker::Config.locale = :ja
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  birthday = Faker::Date.backward
  tel = Faker::Number.number(11)
  wechat_id = Faker::Internet.username
  prefecture_id = Faker::Number.within(1..50)
  visa_id = Faker::Number.within(1..24)

  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               birthday:birthday,
               sex:'男',
               tel:tel,
               wechat_id: wechat_id,
               edu_level:"bachelor",
               jlpt:"N1",
               management:"no",
               chinese_skill:"native",
               visa_id:visa_id,
               prefecture_id:prefecture_id,
               confirmed_at: DateTime.now,
               image:File.open("./app/assets/images/img/sample.jpg"))
end