# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
  :updated_at => "2021-01-01"
)

  Receiver.create!(
    :customer_id => 1,
    :name => "梅⽊匠",
    :postal_code => "2440812",
    :address => "神奈川県横浜市⼾塚区柏尾町3-9-10",
    :created_at => "2021-01-01",
    :updated_at => "2021-01-01"
  )

    Receiver.create!(
    :customer_id => 1,
    :name => "⼭田太郎",
    :postal_code => "1500041",
    :address => "東京都渋⾕区神南１丁⽬１９−１１ パークウェースクエア2	4階",
    :created_at => "2021-01-01",
    :updated_at => "2021-01-01"
  )

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
  :updated_at => "2021-01-01"
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
  :updated_at => "2021-01-01"
)

Admin.create!(
  :email => "admin@admin.com",
  :password => "123456",
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01"
)

Admin.create!(
  :email => "admin2@admin.com",
  :password => "123456",
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01"
)

Genre.create!(
  :name => "ケーキ",
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01"
)

Genre.create!(
  :name => "プリン",
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01"
)

Genre.create!(
  :name => "焼き菓子",
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01"
)

Genre.create!(
  :name => "キャンディ",
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01"
)

Product.create!(
  :genre_id => 1,
  :name => "いちごのショートケーキ",
  :description => "いちごがひとつぶ乗っています。",
  :price => 400,
  :image_id => "",
  :is_active => true,
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01"
)

Product.create!(
  :genre_id => 1,
  :name => "ガトーショコラ",
  :description => "ほろ苦い大人の甘さに仕上げました。",
  :price => 350,
  :image_id => "",
  :is_active => true,
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01"
)

Product.create!(
  :genre_id => 1,
  :name => "チーズケーキ",
  :description => "紅茶のお供にどうぞ。",
  :price => 350,
  :image_id => "",
  :is_active => true,
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01"
)

Product.create!(
  :genre_id => 3,
  :name => "マカロンセット",
  :description => "カラフルでかわいいマカロンのセットです。",
  :price => 1000,
  :image_id => "",
  :is_active => true,
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01"
)

Product.create!(
  :genre_id => 4,
  :name => "キャンディアソート",
  :description => "ハロウィンシーズン限定のキャンディ詰め合わせです。",
  :price => 500,
  :image_id => "",
  :is_active => false,
  :created_at => "2021-01-01",
  :updated_at => "2021-01-01"
)

Order.create!(
  :customer_id => 1,
  :postage => 800,
  :total_price_tax => 825,
  :payment_method => 0,
  :receiver => "⼭⽥花⼦",
  :receiver_postal_code => "1500041",
  :receiver_address => "東京都渋⾕区神南1丁⽬19-11 パークウェースクエア2 4階",
  :status => 1,
  :created_at => "2021-03-01",
  :updated_at => "2021-03-01"
)

  OrderProduct.create!(
    :order_id => 1,
    :product_id => 1,
    :count => 1,
    :price_tax => 440,
    :making_status => 3,
    :created_at => "2021-04-01",
    :updated_at => "2021-04-01"
  )

  OrderProduct.create!(
    :order_id => 1,
    :product_id => 3,
    :count => 1,
    :price_tax => 385,
    :making_status => 3,
    :created_at => "2021-04-01",
    :updated_at => "2021-04-01"
  )

Order.create!(
  :customer_id => 1,
  :postage => 800,
  :total_price_tax => 385,
  :payment_method => 1,
  :receiver => "梅⽊匠",
  :receiver_postal_code => "2440812",
  :receiver_address => "神奈川県横浜市⼾塚区柏尾町3-9-10",
  :status => 4,
  :created_at => "2021-04-01",
  :updated_at => "2021-04-01"
)

  OrderProduct.create!(
    :order_id => 2,
    :product_id => 3,
    :count => 1,
    :price_tax => 385,
    :making_status => 3,
    :created_at => "2021-04-01",
    :updated_at => "2021-04-01"
  )

Order.create!(
  :customer_id => 1,
  :postage => 800,
  :total_price_tax => 1265,
  :payment_method => 0,
  :receiver => "⼭⽥花⼦",
  :receiver_postal_code => "1500041",
  :receiver_address => "東京都渋⾕区神南1丁⽬19-11 パークウェースクエア2 4階",
  :status => 1,
  :created_at => "2021-05-01",
  :updated_at => "2021-05-01"
)

  OrderProduct.create!(
    :order_id => 3,
    :product_id => 1,
    :count => 2,
    :price_tax => 440,
    :making_status => 3,
    :created_at => "2021-04-01",
    :updated_at => "2021-04-01"
  )

    OrderProduct.create!(
    :order_id => 3,
    :product_id => 2,
    :count => 1,
    :price_tax => 385,
    :making_status => 3,
    :created_at => "2021-04-01",
    :updated_at => "2021-04-01"
  )

