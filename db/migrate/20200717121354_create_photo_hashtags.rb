class CreatePhotoHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :photo_hashtags, id: false do |t|
      t.references :photo, foreign_key: true, index: true
      t.references :hashtag, foreign_key: true, index: true
    end
  end
end
