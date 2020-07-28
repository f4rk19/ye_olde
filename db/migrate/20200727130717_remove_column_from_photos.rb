class RemoveColumnFromPhotos < ActiveRecord::Migration[6.0]
  def change
    remove_column :photos, :latitude, :float
  end
end
