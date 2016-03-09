class CreateVasariCollaborators < ActiveRecord::Migration
  def change
    create_table :vasari_collaborators do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
