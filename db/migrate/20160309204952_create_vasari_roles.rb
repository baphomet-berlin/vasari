class CreateVasariRoles < ActiveRecord::Migration
  def change
    create_table :vasari_roles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
