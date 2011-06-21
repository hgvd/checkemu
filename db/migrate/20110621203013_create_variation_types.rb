class CreateVariationTypes < ActiveRecord::Migration
  def change
    create_table :variation_types do |t|
      t.string :name
      t.integer :articles_count, :default => 0
    end
    add_index :variation_types, :name
    add_index :variation_types, :articles_count
  end
end