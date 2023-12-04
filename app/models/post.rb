class Post < ApplicationRecord

  has_one_attached :image

  has_one_attached :music
  
  belongs_to :genre
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

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
  
  
  validates :name, presence: true
  validates :music, presence: true
  
  
  before_create :prepare_save # This callback doesn't validate

  def prepare_save
    self.score = Language.get_data(self.caption)
  end
  

end
