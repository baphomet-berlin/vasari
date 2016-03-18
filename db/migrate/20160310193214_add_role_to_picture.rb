class AddRoleToPicture < ActiveRecord::Migration
  def change
    add_column :vasari_pictures, :role, :int
  end
end
