# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p '==================== customer create ===================='
Customer.create!(first_name: "Taro", last_name: "Yamada", first_name_kana: "タロウ", last_name_kana: "ヤマダ", post_code: "0000000", address: "東京都品川区", phone_number: "00000000000", email: "yamada.taro@gmail.com", password: "111111")
Customer.create!(first_name: "Jiro", last_name: "Yamada", first_name_kana: "ジロウ", last_name_kana: "ヤマダ", post_code: "0000000", address: "東京都品川区", phone_number: "00000000000", email: "yamada.jiro@gmail.com", password: "111111")
Customer.create!(first_name: "Hanako", last_name: "Terada", first_name_kana: "ハナコ", last_name_kana: "テラダ", post_code: "0000000", address: "東京都港区", phone_number: "00000000000", email: "terada.hanako@gmail.com", password: "111111")
Customer.create!(first_name: "Record", last_name: "Tarminal", first_name_kana: "レコード", last_name_kana: "ターミナル", post_code: "0000000", address: "東京都cloud9", phone_number: "00000000000", email: "tarminal.record@gmail.com", password: "111111")
p '==================== admin create ===================='
Admin.create!(email: "admin@gmail.com", password: "000000")
p '==================== item_genre ===================='
item_genre1 = ItemGenre.new(genre: "焼き菓子")
  item_genre1.save!
item_genre2 = ItemGenre.new(genre: "ケーキ")
  item_genre2.save!
item_genre3 = ItemGenre.new(genre: "プリン")
  item_genre3.save!
item_genre4 = ItemGenre.new(genre: "キャンディ")
  item_genre4.save!
p '==================== item ===================='
item1 = Item.new(
  item_name: "フロランタン",
  item_explanation: "フロランタンとは厚焼きのサブレ生地にキャラメルでコーティングした​ スライスアーモンドをのせて香ばしく焼き上げたフランス菓子です。",
  item_price: 200,
  item_genre_id: 1,
  sales_status: true
)
item1.image.attach(io: File.open(Rails.root.join('app/assets/images/yakigashi_1.png')), filename: 'yakigashi_1.png')
item1.save!
