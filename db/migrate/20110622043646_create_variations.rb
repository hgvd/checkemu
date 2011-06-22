class CreateVariations < ActiveRecord::Migration
  def change
    create_table :variations do |t|
      t.integer :article_id
      t.string :mutation_pattern
      t.string :position_pattern
      t.string :wild_type
      t.string :mutant_type
      t.string :position
    end
    add_index :variations, :article_id
  end
end