class Genre < ApplicationRecord
  
  has_many :posts, dependent: :destroy
  
  def genre_display
   + name
  end
  
  validates :name, presence: true
  
end
