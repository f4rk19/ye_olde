class AddColumn2Photo < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :description, :string
  end
end
