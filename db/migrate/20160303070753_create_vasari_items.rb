class CreateVasariItems < ActiveRecord::Migration
  def change
    create_table :vasari_projects do |t|
      t.string :title
      t.date :date_start
      t.date :date_end
      t.date :date
      t.boolean :current
      t.timestamps null: false
    end
    create_table :vasari_pictures do |t|
      t.references :project, index: true, foreign_key: true
      t.attachment :image
      t.timestamps null: false
    end
  end
end
