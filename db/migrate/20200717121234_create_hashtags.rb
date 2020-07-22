class CreateHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :hashtags do |t|
      t.string :hashname
      t.references :photo, foreign_key: true
      t.timestamps
    end
    add_index :hashtags, :hashname, unique: true
  end
end
