class CreatePrototypeImages < ActiveRecord::Migration
  def change
    create_table :prototype_images do |t|
      t.string :image
      t.integer :status
      t.integer :prototype_id

      t.timestamps
    end
  end
end
