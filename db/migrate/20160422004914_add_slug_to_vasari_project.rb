class AddSlugToVasariProject < ActiveRecord::Migration
  def change
    add_column :vasari_projects, :slug, :string
  end
end
