class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, foreign_key: true, null: false,index: true
      t.references :photo, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
