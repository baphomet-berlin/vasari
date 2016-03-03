class CreateVasariItems < ActiveRecord::Migration
  def change
    create_table :vasari_items do |t|
      t.string :title
      t.date :date_start
      t.date :date_end
      t.date :date

      t.timestamps null: false
    end
  end
end
