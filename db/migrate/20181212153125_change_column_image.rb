class ChangeColumnImage < ActiveRecord::Migration[5.2]
  def change
    change_column :photos, :image, :string
  end
end
