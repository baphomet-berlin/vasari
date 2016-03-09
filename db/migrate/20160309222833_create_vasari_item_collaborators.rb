class CreateVasariItemCollaborators < ActiveRecord::Migration
  def change
    create_table :vasari_item_collaborators do |t|
      t.references :item, index: true, foreign_key: true
      t.references :collaborator, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
