class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :likes
  has_many :topics
  has_many :bookmarks
  def liked(bookmark)
    self.likes.where(bookmark_id: bookmark.id).first
  end
end
