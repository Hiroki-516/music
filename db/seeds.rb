# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@admin',
  password: 'adminadmin'
  )
  
  # 取得または登録したインスタンス = モデル.find_or_create_by!(検索キー: 検索する値) do |ブロック変数|
#   ブロック変数.属性 = 登録する値
#   :
#   :
# end

artist1 = User.find_or_create_by!(email: "artist1@artist1") do |user|
  user.name = "アーティスト1"
  user.introduction = "アーティスト1です！"
  user.status = "artist"
  user.password = "artist1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist1-photo.png"), filename:"artist1-photo.png")
end


artist2 = User.find_or_create_by!(email: "artist2@artist2") do |user|
  user.name = "アーティスト2"
  user.introduction = "アーティスト2です！"
  user.status = "artist"
  user.password = "artist2"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist2-photo.png"), filename:"artist2-photo.png")
end


listener1 = User.find_or_create_by!(email: "listener1@listener1") do |user|
  user.name = "リスナー1"
  user.introduction = "リスナー1です！聴くの楽しみ！"
  user.status = "listener"
  user.password = "listener1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/listener1-photo.png"), filename:"listener1-photo.png")
end


genre1 = Genre.find_or_create_by!(name: "BGM")


genre2 = Genre.find_or_create_by!(name: "弾き語り")


genre3 = Genre.find_or_create_by!(name: "J-pop")


Post.find_or_create_by!(name: "愉快な遊び場") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist1-jacket.png"), filename:"artist1-jacket.png")
  post.caption = "なんか愉快な雰囲気にならないかい。"
  post.user = artist1
  post.genre = genre1
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/yukai.wav"), filename:"yukai.wav")
end


Post.find_or_create_by!(name: "迫りくるBGM") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist2-jacket.png"), filename:"artist2-jacket.png")
  post.caption = "怖い雰囲気と迫りくる感じをイメージして作成しました。"
  post.user = artist2
  post.genre = genre1
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/horrorworld.wav"), filename:"horrorworld.wav")
end
