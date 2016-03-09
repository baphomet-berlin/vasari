class AddListableToItem < ActiveRecord::Migration
  def change
    add_reference :vasari_items, :listable, polymorphic: true, index: true
  end
end
