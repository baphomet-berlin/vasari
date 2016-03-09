class CreateVasariLifeEvents < ActiveRecord::Migration
  def change
    create_table :vasari_life_events do |t|

      t.timestamps null: false
    end
  end
end
