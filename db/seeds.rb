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

Customer.create(
  email: 'mo@mo',
  password: 'momomo',
  name: 'もも',
  k_name: 'モモ',
  nickname: 'もも'
  )

  Genre.create(
    id: '1',
    genre_name: '和食'
  )

  Genre.create(
    id: '2',
    genre_name: '洋食'
  )

  Genre.create(
    id: '3',
    genre_name: '中華'
  )

  Cuisine.create(
    genre_id: '1',
    customer_id: '1',
    cuisine_name: 'お好み焼き',
    cuisine_image: 'images/image.cuinise/TCPAKU0649_TP_V',
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
