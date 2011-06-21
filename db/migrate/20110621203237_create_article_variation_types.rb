class CreateArticleVariationTypes < ActiveRecord::Migration
  def change
    create_table :article_variation_types do |t|
      t.integer :article_id
      t.integer :variation_type_id
    end
    add_index :article_variation_types, :article_id
    add_index :article_variation_types, :variation_type_id
  end
end