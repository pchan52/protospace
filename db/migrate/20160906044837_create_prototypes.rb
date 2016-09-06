class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :name
      t.text :concept
      t.text :catch_copy
      t.integer :likes_count
      t.integer :user_id
      t.timestamps
    end
  end
end