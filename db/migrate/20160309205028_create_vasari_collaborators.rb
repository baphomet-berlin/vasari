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
    create_table :vasari_item_collaborators do |t|
      t.references :vasari_portfolio_item, index: true, foreign_key: true
      t.references :vasari_collaborator, index: true, foreign_key: true
      t.references :vasari_role, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
