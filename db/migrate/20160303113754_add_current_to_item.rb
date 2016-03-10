class AddCurrentToItem < ActiveRecord::Migration
  def change
    add_column :vasari_items, :current, :boolean
  end
end
