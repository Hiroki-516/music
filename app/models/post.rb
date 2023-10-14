class Post < ApplicationRecord

  has_one_attached :image

  has_one_attached :music

  belongs_to :user
  has_many :favorites
  has_many :post_comments

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/music.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    #to_sは文字列とつなぐためのもので、ここでは画像のIntrinsic size最大値を決めてる
    image.variant(resize: width.to_s + "x" + height.to_s + "!").processed
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
