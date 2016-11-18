class RenameImageColumnToPrototypeImages < ActiveRecord::Migration
  def change
    rename_column :prototype_images, :content, :content
  end
end
