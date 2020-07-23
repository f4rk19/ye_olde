class Hashtag < ApplicationRecord
  has_many :photo_hashtags
  has_many :photos, through: :photo_hashtags

  validates :hashname, presence: true, length: {maximum:99}

  def self.search(search)
    if search
      Hashtag.where('hashname LIKE(?)', "%#{search}%")
    else
      Hashtag.all
    end
  end
end
