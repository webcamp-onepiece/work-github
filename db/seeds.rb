# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!(
  :family_name => "令和",
  :first_name => "道子",
  :family_name_kana => "レイワ",
  :first_name_kana => "ミチコ",
  :postal_code => "0000000",
  :address => "東京都渋⾕区代々⽊神園町0-0",
  :phone_number => "0000000000",
  :is_deleted => false,
  :email => "sample@example.com",
  :password => "123456",
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01",
)

Customer.create!(
  :family_name => "⼭⽥",
  :first_name => "花⼦",
  :family_name_kana => "ヤマダ",
  :first_name_kana => "ハナコ",
  :postal_code => "1500041",
  :address => "東京都渋⾕区神南１丁⽬１９−１１ パークウェースクエア2	4階",
  :phone_number => "0368694700",
  :is_deleted => false,
  :email => "hoge@example.com",
  :password => "123456",
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01",
)

Customer.create!(
  :family_name => "⼭⽥",
  :first_name => "太郎",
  :family_name_kana => "ヤマダ",
  :first_name_kana => "タロウ",
  :postal_code => "1500041",
  :address => "東京都渋⾕区神南１丁⽬１９−１１ パークウェースクエア2	4階",
  :phone_number => "0368694700",
  :is_deleted => true,
  :email => "hogehoge@example.com",
  :password => "123456",
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01",
)

Admin.create!(
  :email => "admin@admin.com",
  :password => "123456",
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01",
)

Admin.create!(
  :email => "admin2@admin.com",
  :password => "123456",
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01",
)

G
