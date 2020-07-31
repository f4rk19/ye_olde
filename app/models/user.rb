class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos
  has_many :comments
  has_many :bookmarks
  has_many :bookmark_photos, through: :bookmarks, source: :photo

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

end
