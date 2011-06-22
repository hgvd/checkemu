class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.string :symbol
      t.string :name
      t.string :chromosome
      t.string :map_location
      t.string :synonyms
      t.integer :articles_count, :default => 0
    end
    add_index :genes, :symbol
    add_index :genes, [:articles_count, :symbol]
  end
end