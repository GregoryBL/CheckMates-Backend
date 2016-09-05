class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :description
      t.integer :price
      t.references :bill, foreign_key: true
      t.string :user_id
    end
  end
end
