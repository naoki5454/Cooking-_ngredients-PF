# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
  email: 'test@test',
  password: 'testtest',
  )

  10.times do |n|
    Customer.create(
      email: "mo@mo#{n + 1}",
      password: "momomo#{n + 1}",
      name: "もも#{n + 1}",
      k_name: "モモ#{n + 1}",
      nickname: "もも#{n + 1}"
    )
  end

  15.times do |n|
    Genre.create(
      id: "#{n + 1}",
      genre_name: "和食#{n + 1}"
    )
  end

  15.times do |n|
    Cuisine.create(
      genre_id: "#{n + 1}",
      customer_id: "#{n + 1}",
      cuisine_name: "お好み焼き#{n + 1}",
      cuisine_image: open("./app/assets/images/image/TCPAKU0649_TP_V.jpg"),
      material_introduction:
      '４人分
      キャベツ =>半玉
      たこ焼き粉 =>500g',
      introduction:
      '工程
      材料を切って混ぜて焼く
      !point!
      先に鉄板を温めておくと綺麗に焼ける',
      time: '15'
    )
  end

  Cuisine.create(
    genre_id: '3',
    customer_id: '1',
    cuisine_name: '卵かけごはん',
    cuisine_image: File.open("./app/assets/images/image/YAMA845007_TP_V.jpg"),
    material_introduction:
    '卵
    万能ネギ
    いりごま
    ごま油',
    introduction:
    '工程
    盛り付けてまぜるのみ
    !point!
    薬味（万能ネギ、いりごま）を最後に乗っけると見た目が良くなる',
    time: '3'
  )

  Cuisine.create(
    genre_id: '5',
    customer_id: '1',
    cuisine_name: '残り物チャーハン',
    cuisine_image: File.open("./app/assets/images/image/9V9A6497_TP_V.jpg"),
    material_introduction:
    '冷蔵庫に残っている野菜
    さめたごはん',
    introduction:
    '工程
    先に野菜を炒めてからごはんを投入
    !point!
    野菜の水分を飛ばすのを意識するとパラパラになりやすいよ',
    time: '10'
  )

  Cuisine.create(
    genre_id: '8',
    customer_id: '1',
    cuisine_name: '簡単焼きそば',
    cuisine_image: File.open("./app/assets/images/image/9V9A6333_TP_V.jpg"),
    material_introduction:
    '冷蔵庫に残っている野菜
    焼きそばの麺',
    introduction:
    '工程
    野菜のシャキシャキを楽しみたいなら先に麺から炒める
    そうでなければ、野菜から！
    !point!
    付属のソースをなくしても安心！
    塩胡椒でもソースに負けないくらい美味しい',
    time: '10'
  )

  Cuisine.create(
    genre_id: '1',
    customer_id: '1',
    cuisine_name: '家族が風邪引いた時のおかゆ',
    cuisine_image: File.open("./app/assets/images/image/IMG_0066_TP_V.jpg"),
    material_introduction:
    '水菜
    大葉
    梅肉（梅）
    炊いたごはん',
    introduction:
    '工程
    ごはんを鍋で温めつつ上にのせる野菜を準備する
    水と梅肉を少し入れて焦げないように混ぜる
    !point!
    鰹節や生姜を入れも美味しい',
    time: '10'
  )

  10.times do |n|
    Contact.create(
     customer_id: "#{n + 1}",
     name: "みかん#{n + 1}",
     message: "洋食#{n + 1}のジャンルを追加して欲しいです。",
    )
  end