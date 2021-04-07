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
    genre_name: '揚げ物'
    )