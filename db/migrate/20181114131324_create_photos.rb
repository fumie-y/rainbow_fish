class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.binary :image
      t.text :photo_comment
      t.string :rgb

      t.timestamps
    end
  end
end
