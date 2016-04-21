class CreateVasariEmbeds < ActiveRecord::Migration
  def change
    create_table :vasari_embeds do |t|
      t.string :title
      t.string :provider
      t.string :original_url
      t.text :code
      t.references :project, index: true, foreign_key: true
      t.paperclip :preview
    end
  end
end
