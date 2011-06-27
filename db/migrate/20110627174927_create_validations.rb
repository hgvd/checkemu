class CreateValidations < ActiveRecord::Migration
  def change
    create_table :validations do |t|
      t.integer :article_id
      t.integer :user_id
      t.string :verdict
      t.string :note
      t.timestamps
    end
    add_index :validations, :article_id
    add_index :validations, [:user_id, :article_id]
    add_index :validations, :verdict
  end
end