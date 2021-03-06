class CreateVasariProjects < ActiveRecord::Migration
  def change
    create_table :vasari_projects do |t|
      t.string :title
      t.date :date_start
      t.date :date_end
      t.date :date
      t.boolean :current
      t.text :brief_description
      t.text :content
      t.timestamps null: false
    end
  end
end
