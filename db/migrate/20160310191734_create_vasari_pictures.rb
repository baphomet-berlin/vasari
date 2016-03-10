class CreateVasariPictures < ActiveRecord::Migration
  def change
    create_table :vasari_pictures do |t|
      t.references :vasari_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
