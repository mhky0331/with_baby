# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者パスワード
Admin.create!(
   name: "wb",
   email:"admin@admin",
password:  "111111"
  )

  # ユーザー
[
  ['test1@test.com', 'はる', profile_image: File.open('./app/assets/images/user_no_image.jpg'), password: 111111],
  ['test2@test.com', 'なつ', profile_image: File.open('./app/assets/images/user_no_image.jpg'), password: 111111],
  ['test3@test.com', 'あき', profile_image: File.open('./app/assets/images/user_no_image.jpg'), password: 111111],
  ['test4@test.com', 'ふゆ', profile_image: File.open('./app/assets/images/user_no_image.jpg'), password: 111111]
].each do |mail, name, profile_image, password|
  User.create!(
    { email: mail, name: name, profile_image: profile_image, password: password}
  )
  end

