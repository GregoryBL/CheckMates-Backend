class ChangeDescriptionToItemDescription < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :description, :item_description
  end
end
