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
  item_price: 300,
  item_genre_id: 1,
  sales_status: true
  )
  item1.image.attach(io: File.open(Rails.root.join('app/assets/images/yakigashi_1.png')), filename: 'yakigashi_1.png')
  item1.save!
item2 = Item.new(
  item_name: "オペラ",
  item_explanation: "ハイカカオチョコクリームとホワイトチョコクリームの2つのおいしさが一度に味わえるケーキ。",
  item_price: 500,
  item_genre_id: 2,
  sales_status: true
  )
  item2.image.attach(io: File.open(Rails.root.join('app/assets/images/cake_2.png')), filename: 'cake_2.png')
  item2.save!
item3 = Item.new(
  item_name: "フィグ",
  item_explanation: "チョコスポンジ、チョコガナッシュ、チョコクリームを重ねた層に、キャラパキチョコを埋めました。",
  item_price: 1500,
  item_genre_id: 2,
  sales_status: true
  )
  item3.image.attach(io: File.open(Rails.root.join('app/assets/images/cake_1.png')), filename: 'cake_1.png')
  item3.save!
item4 = Item.new(
  item_name: "エイタロウ",
  item_explanation: "砂糖だけではなく、はちみつを入れるとコクのある味わいのキャンディー。",
  item_price: 300,
  item_genre_id: 4,
  sales_status: true
  )
  item4.image.attach(io: File.open(Rails.root.join('app/assets/images/candy2.png')), filename: 'candy2.png')
  item4.save!
item5 = Item.new(
  item_name: "カファレル",
  item_explanation: "カファレルのキャンディは、目を引く華やかなパッケージが魅力です。",
  item_price: 300,
  item_genre_id: 4,
  sales_status: true
  )
  item5.image.attach(io: File.open(Rails.root.join('app/assets/images/candy1.png')), filename: 'candy1.png')
  item5.save!
item6 = Item.new(
  item_name: "パパブブレ",
  item_explanation: "パパブブレは、2003年にスタートしたスペイン・バルセロナ発のキャンディ",
  item_price: 500,
  item_genre_id: 4,
  sales_status: true
  )
  item6.image.attach(io: File.open(Rails.root.join('app/assets/images/candy_4.png')), filename: 'candy_4.png')
  item6.save!
item7 = Item.new(
  item_name: "チョコレート グレーズド",
  item_explanation: "オリジナル・グレーズドに、なめらかチョコレートをアイシング。チョコレート大好きな方におすすめ。",
  item_price: 400,
  item_genre_id: 1,
  sales_status: true
  )
  item7.image.attach(io: File.open(Rails.root.join('app/assets/images/chocolate_doughnut.png')), filename: 'chocolate_doughnut.png')
  item7.save!
item8 = Item.new(
  item_name: "オリジナル・グレーズド",
  item_explanation: "温めるとおいしさがとろ〜り深まり、優しい甘さが口の中に広がります。",
  item_price: 400,
  item_genre_id: 1,
  sales_status: true
  )
  item8.image.attach(io: File.open(Rails.root.join('app/assets/images/red_doughnut.png')), filename: 'red_doughnut.png')
  item8.save!
item9 = Item.new(
  item_name: "フレッシュクリームプリン",
  item_explanation: "1本1本手作りにこだわったプリンはお土産にもぴったり！ じっくり丁寧に蒸し上げたプリンはとろ～りなめらかで昔懐かしい味わい。",
  item_price: 400,
  item_genre_id: 3,
  sales_status: true
  )
  item9.image.attach(io: File.open(Rails.root.join('app/assets/images/purine_2.png')), filename: 'purine_2.png')
  item9.save!
item10 = Item.new(
  item_name: "オレンジケーキ",
  item_explanation: "オレンジの爽やかな味わいとフレッシュバターの芳醇な香りをお楽しみいただけます。",
  item_price: 500,
  item_genre_id: 2,
  sales_status: true
  )
  item10.image.attach(io: File.open(Rails.root.join('app/assets/images/cut_cake_1.png')), filename: 'cut_cake_1.png')
  item10.save!