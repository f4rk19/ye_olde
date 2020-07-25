class Photo < ApplicationRecord
  belongs_to :user
  has_many :photo_hashtags, dependent: :delete_all
  has_many :hashtags, through: :photo_hashtags
  has_many :comments

  after_create do
    photo = Photo.find_by(id: self.id)
    hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      photo.hashtags << tag
    end
  end

  before_update do
    photo = Photo.find_by(id: self.id)
    photo.hashtags.clear
    hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete("#"))
      photo.hashtags << tag
    end
  end


  validates :content, {presence: true, length: {maximum: 140}}
  validates :image,{ presence: true}

  mount_uploader :image, ImageUploader
end
