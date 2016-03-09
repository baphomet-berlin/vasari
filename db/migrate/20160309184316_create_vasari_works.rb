class CreateVasariWorks < ActiveRecord::Migration
  def change
    create_table :vasari_works do |t|
      t.timestamps null: false
    end
  end
end
