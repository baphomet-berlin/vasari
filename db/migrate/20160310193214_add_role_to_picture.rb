class AddRoleToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :role, :int
  end
end
