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
  item_name: "バナナプリン",
  item_explanation: "バナナの優しい甘さとほろ苦カラメル、ラム酒の香りが絶妙にマッチ！",
  item_price: 400,
  item_genre_id: 3,
  sales_status: true
  )
  item1.image.attach(io: File.open(Rails.root.join('app/assets/images/banana_pudding2.jpg')), filename: 'banana_pudding2.jpg')
  item1.save!
item2 = Item.new(
  item_name: "濃厚ブラウニー",
  item_explanation: "ブラウニーは、溶かしたチョコレートやココアパウダーを使って焼き上げるお菓子です。",
  item_price: 500,
  item_genre_id: 1,
  sales_status: true
  )
  item2.image.attach(io: File.open(Rails.root.join('app/assets/images/brownie.jpg')), filename: 'brownie.jpg')
  item2.save!
item3 = Item.new(
  item_name: "カファレル",
  item_explanation: "カファレルのキャンディは、目を引く華やかなパッケージが魅力です。",
  item_price: 1000,
  item_genre_id: 4,
  sales_status: true
  )
  item3.image.attach(io: File.open(Rails.root.join('app/assets/images/candy.jpg')), filename: 'candy.jpg')
  item3.save!
item4 = Item.new(
  item_name: "パパブブレ",
  item_explanation: "パパブブレは、2003年にスタートしたスペイン・バルセロナ発のキャンディ",
  item_price: 500,
  item_genre_id: 4,
  sales_status: true
  )
  item4.image.attach(io: File.open(Rails.root.join('app/assets/images/candy2.jpg')), filename: 'candy2.jpg')
  item4.save!
item5 = Item.new(
  item_name: "チーズケーキ",
  item_explanation: "濃厚なのにスッと溶ける。おいしい記憶をたどるチーズケーキ",
  item_price: 700,
  item_genre_id: 2,
  sales_status: true
  )
  item5.image.attach(io: File.open(Rails.root.join('app/assets/images/cheese_cake.jpg')), filename: 'cheese_cake.jpg')
  item5.save!
item6 = Item.new(
  item_name: "チョコチップクッキー",
  item_explanation: "一口食べたらやみつきになる定番クッキー。",
  item_price: 300,
  item_genre_id: 1,
  sales_status: true
  )
  item6.image.attach(io: File.open(Rails.root.join('app/assets/images/chocochip_cookie.jpg')), filename: 'chocochip_cookie.jpg')
  item6.save!
item7 = Item.new(
  item_name: "オペラ",
  item_explanation: "ハイカカオチョコクリームとホワイトチョコクリームの2つのおいしさが一度に味わえるケーキ。",
  item_price: 2300,
  item_genre_id: 2,
  sales_status: true
  )
  item7.image.attach(io: File.open(Rails.root.join('app/assets/images/chocolate_cake.jpg')), filename: 'chocolate_cake.jpg')
  item7.save!
item8 = Item.new(
  item_name: "チョコレートクッキー",
  item_explanation: "焼いてもくちどけの良いなめらかなチョコが特徴。",
  item_price: 300,
  item_genre_id: 1,
  sales_status: true
  )
  item8.image.attach(io: File.open(Rails.root.join('app/assets/images/chocolate_cookie.jpg')), filename: 'chocolate_cookie.jpg')
  item8.save!
item9 = Item.new(
  item_name: "ホワイトチョコクッキー",
  item_explanation: "ホワイトチョコのさくさくクッキーです。",
  item_price: 300,
  item_genre_id: 1,
  sales_status: true
  )
  item9.image.attach(io: File.open(Rails.root.join('app/assets/images/white_chocolate.jpg')), filename: 'white_chocolate.jpg')
  item9.save!
item10 = Item.new(
  item_name: "シナモンクッキー",
  item_explanation: "シナモンが香るさくさくクッキーです。",
  item_price: 300,
  item_genre_id: 1,
  sales_status: true
  )
  item10.image.attach(io: File.open(Rails.root.join('app/assets/images/cinnamon_cookie.jpg')), filename: 'cinnamon_cookie.jpg')
  item10.save!
item11 = Item.new(
  item_name: "クレームブリュレ",
  item_explanation: "クレームブリュレとは、フランス語で焦がしたクリームという意味を持つ洋菓子のこと。",
  item_price: 700,
  item_genre_id: 3,
  sales_status: true
  )
  item11.image.attach(io: File.open(Rails.root.join('app/assets/images/creme_brulee.jpg')), filename: 'creme_brulee.jpg')
  item11.save!
item12 = Item.new(
  item_name: "オリジナルドーナッツ",
  item_explanation: "当店オリジナル。モチモチした食感のチョコレートドーナッツです。",
  item_price: 400,
  item_genre_id: 1,
  sales_status: true
  )
  item12.image.attach(io: File.open(Rails.root.join('app/assets/images/doughnut.jpg')), filename: 'doughnut.jpg')
  item12.save!
item13 = Item.new(
  item_name: "フレッシュクリームプリン",
  item_explanation: "1本1本手作りにこだわったプリンはお土産にもぴったり！ じっくり丁寧に蒸し上げたプリンはとろ～りなめらかで昔懐かしい味わい。",
  item_price: 400,
  item_genre_id: 3,
  sales_status: true
  )
  item13.image.attach(io: File.open(Rails.root.join('app/assets/images/pudding.jpg')), filename: 'pudding.jpg')
  item13.save!
item14 = Item.new(
  item_name: "ハーフ＆ハーフクッキー",
  item_explanation: "ビターチョコとホワイトチョコのさくさくクッキーです。",
  item_price: 300,
  item_genre_id: 1,
  sales_status: true
  )
  item14.image.attach(io: File.open(Rails.root.join('app/assets/images/half_cookie.jpg')), filename: 'half_cookie.jpg')
  item14.save!
item15 = Item.new(
  item_name: "マカロン(8個入り)",
  item_explanation: "ピスタチオ、チョコ、ホワイトチョコ、モカ、ストロベリーの味をお楽しみください。",
  item_price: 800,
  item_genre_id: 1,
  sales_status: true
  )
  item15.image.attach(io: File.open(Rails.root.join('app/assets/images/macarons.jpg')), filename: 'macarons.jpg')
  item15.save!
item16 = Item.new(
  item_name: "オペラ",
  item_explanation: "ハイカカオチョコクリームとホワイトチョコクリームの2つのおいしさが一度に味わえるケーキ。",
  item_price: 800,
  item_genre_id: 2,
  sales_status: true
  )
  item16.image.attach(io: File.open(Rails.root.join('app/assets/images/opera.jpg')), filename: 'opera.jpg')
  item16.save!
item17 = Item.new(
  item_name: "オレンジケーキ",
  item_explanation: "オレンジの爽やかな味わいとフレッシュバターの芳醇な香りをお楽しみいただけます。",
  item_price: 1200,
  item_genre_id: 2,
  sales_status: true
  )
  item17.image.attach(io: File.open(Rails.root.join('app/assets/images/orange_cake.jpg')), filename: 'orange_cake.jpg')
  item17.save!
item18 = Item.new(
  item_name: "フロランタン",
  item_explanation: "フロランタンとは厚焼きのサブレ生地にキャラメルでコーティングした​ スライスアーモンドをのせて香ばしく焼き上げたフランス菓子です。",
  item_price: 300,
  item_genre_id: 1,
  sales_status: true
  )
  item18.image.attach(io: File.open(Rails.root.join('app/assets/images/florentins.jpg')), filename: 'florentins.jpg')
  item18.save!