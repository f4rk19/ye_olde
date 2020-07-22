class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :content, null: false
      t.string :image, null: false
      t.references :user
      t.references :hashtag
      t.timestamps
    end
  end
end
