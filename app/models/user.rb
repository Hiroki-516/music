class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  
  # プロフィール画像がアタッチされていない場合に、デフォルトの画像をアタッチし、指定された幅と高さにリサイズされたプロフィール画像を返します。
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  # フォローしたときの処理
  def follow(user)
    relationships.create(followed_id: user.id)
  end
  
  # フォローを外すときの処理
  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end

  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
  
  def is_deleted_text
    if self.is_deleted == false
      '有効'
    else
      '退会'
    end
  end
  
  # 検索メソッドが追加され指定されたキーワードでユーザーを検索できる
  def self.search(keyword)
    where("name LIKE ?", "%#{keyword}%")
  end
  
  
   # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人（一覧画面）
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 与フォロー関係を通じて参照→自分がフォローしている人（一覧画面）
  has_many :followings, through: :relationships, source: :followed
         
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
         
  validates :name, presence: true
  validates :status, presence: true
  
  enum status: { artist: 0, listener: 1 }
  
  

end
