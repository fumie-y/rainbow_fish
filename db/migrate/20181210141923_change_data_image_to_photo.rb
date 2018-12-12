class ChangeDataImageToPhoto < ActiveRecord::Migration[5.2]
  def change
    change_column :photo, :image, :string
  end
end
