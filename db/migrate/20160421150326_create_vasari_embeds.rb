class CreateVasariEmbeds < ActiveRecord::Migration
  def change
    create_table :vasari_embeds do |t|
      t.string :title
      t.string :provider
      t.string :original_url
      t.text :code
      t.references :embeddable, polymorphic: true, index: true      
      t.attachment :preview
    end
  end
end
