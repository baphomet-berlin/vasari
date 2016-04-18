class CreateVasariCollaborators < ActiveRecord::Migration
  def change
    create_table :vasari_collaborators do |t|
      t.string :name
      t.string :url
      t.timestamps null: false
    end
    create_table :vasari_roles do |t|
      t.string :name

      t.timestamps null: false
    end
    create_table :vasari_portfolio_item_collaborators do |t|
      t.references :item, index: true, foreign_key: true
      t.references :collaborator, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
