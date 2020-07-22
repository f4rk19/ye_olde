class ChangeDatatypeContentOfPhotos < ActiveRecord::Migration[6.0]
  def change
    change_column :photos, :content, :text
  end
end
