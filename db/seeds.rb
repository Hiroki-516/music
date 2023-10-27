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


artist3 = User.find_or_create_by!(email: "artist3@artist3") do |user|
  user.name = "アーティスト3"
  user.introduction = "アーティスト3です！"
  user.status = "artist"
  user.password = "artist3"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist3-photo.png"), filename:"artist3-photo.png")
end


artist4 = User.find_or_create_by!(email: "artist4@artist4") do |user|
  user.name = "アーティスト4"
  user.introduction = "アーティスト4です！"
  user.status = "artist"
  user.password = "artist4"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist4-photo.jpg"), filename:"artist4-photo.jpg")
end


artist5 = User.find_or_create_by!(email: "artist5@artist5") do |user|
  user.name = "アーティスト5"
  user.introduction = "アーティスト5です！"
  user.status = "artist"
  user.password = "artist5"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist5-photo.png"), filename:"artist5-photo.png")
end


artist6 = User.find_or_create_by!(email: "artist6@artist6") do |user|
  user.name = "アーティスト6"
  user.introduction = "アーティスト6です！"
  user.status = "artist"
  user.password = "artist6"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist6-photo.png"), filename:"artist6-photo.png")
end


kunyan1 = User.find_or_create_by!(email: "kunyan1@kunyan1") do |user|
  user.name = "Canvas Project"
  user.introduction = "Canvas Projectです！素敵な楽曲是非楽しみなさ～い！"
  user.status = "artist"
  user.password = "kunyan1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ku-nyan1.png"), filename:"ku-nyan1.png")
end


kunyan2 = User.find_or_create_by!(email: "kunyan2@kunyan2") do |user|
  user.name = "くーにゃん"
  user.introduction = "約10年間作曲しながらエンジニアしてます！是非楽しんでください～！"
  user.status = "artist"
  user.password = "kunyan2"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ku-nyan2.png"), filename:"ku-nyan2.png")
end


kunyan3 = User.find_or_create_by!(email: "kunyan3@kunyan3") do |user|
  user.name = "星くずのお茶会"
  user.introduction = "是非あなたもお茶でも飲みながらゆっくりしていってね～！"
  user.status = "artist"
  user.password = "kunyan3"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ku-nyan3.png"), filename:"ku-nyan3.png")
end


kunyan4 = User.find_or_create_by!(email: "kunyan4@kunyan4") do |user|
  user.name = "CURYN"
  user.introduction = "癒しを提供していきたいなあ！"
  user.status = "artist"
  user.password = "kunyan4"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ku-nyan4.png"), filename:"ku-nyan4.png")
end


kunyan5 = User.find_or_create_by!(email: "kunyan5@kunyan5") do |user|
  user.name = "くーにゃん with Chronostasis"
  user.introduction = "かっこいいアーティストを目指したいよ～！"
  user.status = "artist"
  user.password = "kunyan5"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ku-nyan5.png"), filename:"ku-nyan5.png")
end


genre1 = Genre.find_or_create_by!(name: "BGM")


genre2 = Genre.find_or_create_by!(name: "弾き語り")


genre3 = Genre.find_or_create_by!(name: "J-pop")


Post.find_or_create_by!(name: "愉快な遊び場") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist1-jacket.png"), filename:"artist1-jacket.png")
  post.caption = "なんか愉快な雰囲気にならないかい。"
  post.user = artist1
  post.genre = genre1
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/yukai.mp3"), filename:"yukai.mp3")
end


Post.find_or_create_by!(name: "怪物たちよ（saucydog.cover）") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist2-jacket.png"), filename:"artist2-jacket.png")
  post.caption = "この歌が好きで弾き語りでアレンジしてみました。"
  post.user = artist2
  post.genre = genre2
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/monsters-saucy.mp3"), filename:"monsters-saucy.mp3")
end


Post.find_or_create_by!(name: "迫りくる恐怖") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist3-jacket.jpg"), filename:"artist3-jacket.jpg")
  post.caption = "この歌が好きで弾き語りでアレンジしてみました。"
  post.user = artist3
  post.genre = genre1
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/horrorworld.mp3"), filename:"horrorworld.mp3")
end


Post.find_or_create_by!(name: "たどり着いた先へ") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist4-jacket.jpg"), filename:"artist4-jacket.jpg")
  post.caption = "感動的な、安心したシーンをイメージして作曲しました。"
  post.user = artist4
  post.genre = genre1
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/happyend.mp3"), filename:"happyend.mp3")
end


Post.find_or_create_by!(name: "光の速度で！") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist5-jacket.jpg"), filename:"artist5-jacket.jpg")
  post.caption = "なにかの目標が達成できた時、明るい未来を表現して作曲したよん！。"
  post.user = artist5
  post.genre = genre1
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/wonderful .mp3"), filename:"wonderful .mp3")
end


Post.find_or_create_by!(name: "ひろしの回想") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/artist6-jacket.jpg"), filename:"artist6-jacket.jpg")
  post.caption = "クレヨンしんちゃんオトナ帝国の逆襲のBGMが好きでカバーしてみました！。"
  post.user = artist6
  post.genre = genre1
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ひろしの回想.mp3"), filename:"ひろしの回想.mp3")
end


Post.find_or_create_by!(name: "Days at the mansion") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kunyan1-jacket.png"), filename:"kunyan1-jacket.png")
  post.caption = "寄り添いながらも切なさを詰め込んだ想いを込めて作曲しました。是非きいてみてください！"
  post.user = kunyan1
  post.genre = genre1
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/Days at the mansion.mp3"), filename:"Days at the mansion.mp3")
end


Post.find_or_create_by!(name: "走れ！トラちゃん") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kunyan2-jacket.jpg"), filename:"kunyan2-jacket.jpg")
  post.caption = "寄り添いながらも切なさを詰め込んだ想いを込めて作曲しました。是非きいてみてください！"
  post.user = kunyan2
  post.genre = genre1
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/Qoo_orient_battle_tora.mp3"), filename:"Qoo_orient_battle_tora.mp3")
end


Post.find_or_create_by!(name: "ほしぞらワルツ") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kunyan3-jacket.jpg"), filename:"kunyan3-jacket.jpg")
  post.caption = "溢れ出す満天の星空を是非感じてください～！"
  post.user = kunyan3
  post.genre = genre1
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/ほしぞらワルツ0518_3.mp3"), filename:"ほしぞらワルツ0518_3.mp3")
end


Post.find_or_create_by!(name: "まんまる") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kunyan4-jacket.jpeg"), filename:"kunyan4-jacket.jpeg")
  post.caption = "かわいらしい表現をいれつつその苦痛も織り交ぜたバラードを弾き語りしました！"
  post.user = kunyan4
  post.genre = genre2
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/まんまる2018_2.mp3"), filename:"まんまる2018_2.mp3")
end


Post.find_or_create_by!(name: "彩り") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/irodori_jacket1600.jpg"), filename:"irodori_jacket1600.jpg")
  post.caption = "疾走感にあふれたアニソンをイメージして作成しました！！"
  post.user = kunyan5
  post.genre = genre3
  post.music = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/彩り 2023.1.23.mp3"), filename:"彩り 2023.1.23.mp3")
end